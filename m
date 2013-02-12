Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1U5Lqn-0001NB-5c; Tue, 12 Feb 2013 20:49:10 +0100
Received: by mail-lb0-f180.google.com with SMTP id q12so375687lbc.39
	for <multiple recipients>; Tue, 12 Feb 2013 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=V4sexrBGo8h944VqG4VjRsf2MNVW0mxsEeo34Jz7Q/o=;
	b=yY1nqXVYBG6LfuTJJGFaFSYnV1vIjxGeSUsn7LFX/BhPcOvqYfBibXxN7HGNa0yNT6
	e4oV/aDzo+cfHEQem7fJlGk7ku2I0RAdMQ16fBbV5VA5YK8Hp/TR7zrS0J8ArMxPRkMQ
	GBNdB8P0hCK7pycFXm2DuNB/DYnf4xRBF1fzqbUsWWymygdK6y/H9SuElmLyS7SwMb5p
	IbVn2XRrEcIn9eZ23f/+WuFnj+HXUnBumgP+v+V1OL/ZKFv8lCpiiEH3eVp4Rs8kaiSz
	iLcrkKzQLEJfp+UHRhwgtUNaW9jhUNcOIgKnNM+VPW0CrWFaur2lfKZFoHRmMg5AV/pE
	QI7g==
X-Received: by 10.112.16.137 with SMTP id g9mr7687454lbd.119.1360697589125;
	Tue, 12 Feb 2013 11:33:09 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Tue, 12 Feb 2013 11:32:48 -0800 (PST)
In-Reply-To: <20130212191902.GD3300@jama>
References: <2760168.9kFd94gL1F@helios> <20130212191902.GD3300@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 12 Feb 2013 12:32:48 -0700
X-Google-Sender-Auth: 5104lRI0SiWc1CIV4KLc4dKwJ9A
Message-ID: <CABcZAN=ZXF=mLKzd7EswuFj4FLO5WosnciFUjSLst3uZE38wKA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 19:49:12 -0000
Content-Type: multipart/alternative; boundary=f46d04016fa172535c04d58c1841

--f46d04016fa172535c04d58c1841
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 12, 2013 at 12:19 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see
> this
> > as a distro policy decision; these should move to the layers for
> whichever
> > distros want this. FWIW, this is particularly egregious if you've already
> > built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.
>
> MySQL and PostgreSQL are not in oe-core so it cannot be replaced with
> simple PACKAGECONFIG option in oe-core recipe, but I also prefer to
> share such .bbappend somewhere instead of every distribution reinventing
> the wheel when trying to enable something as simple as db in qt.


I don't see any reason the oe-core recipe couldn't provide the
packageconfig options, even missing the dependencies. They are valid
package configuration options, so they should exist in PACKAGECONFIG. If a
distro wants to enable one of them, however, they'd better include the
layers that provide the deps :)
-- 
Christopher Larson

--f46d04016fa172535c04d58c1841
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 12, 2013 at 12:19 PM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt; * meta-oe/recipes-qt/=
qt4/qt4-x11-free_4.8.4.bbappend<br>
&gt; * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend<br>
&gt; These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I se=
e this<br>
&gt; as a distro policy decision; these should move to the layers for which=
ever<br>
&gt; distros want this. FWIW, this is particularly egregious if you&#39;ve =
already<br>
&gt; built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.<=
br>
<br>
</div>MySQL and PostgreSQL are not in oe-core so it cannot be replaced with=
<br>
simple PACKAGECONFIG option in oe-core recipe, but I also prefer to<br>
share such .bbappend somewhere instead of every distribution reinventing<br=
>
the wheel when trying to enable something as simple as db in qt.</blockquot=
e></div><br>I don&#39;t see any reason the oe-core recipe couldn&#39;t prov=
ide the packageconfig options, even missing the dependencies. They are vali=
d package configuration options, so they should exist in PACKAGECONFIG. If =
a distro wants to enable one of them, however, they&#39;d better include th=
e layers that provide the deps :)<br>

-- <br>Christopher Larson</div></div>

--f46d04016fa172535c04d58c1841--
