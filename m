Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 60A9E6A4D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:11:34 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so1824985vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FPj0ZH0lJtgwCwLEbQHTNKxKXKe4XWYtZS5GZgidyrw=;
	b=xq/e1tbNDyyBkzkqBZS3zovVnYliQGIB3sMtwpzC85qOtZW9ldxpdL0l653Q5SLR4K
	8opEeLkVR/DOUNAJN2pygKfI0mlXmX4687t+oXzm85vI8uX+c8hZ/T77EN6opwwGsieW
	nXxZej26NrIkBkuquJ1wifQJckZ9hD25LcwxKslg0/Fe32HPOWldrJKhNblhaLbdJIzr
	CT8oEM4Kp0sFCuXqKGPQLSooieoCdcMCx8zIL2+YKpgv/qUoBDGsiSVE+sh6kwx/edCz
	8fhce6kKCh4x/+OEF9SMrw/YpkhSQ+JVkOwzToJzXrShx6Zx+e6dX4jvhgvtLibxBUKn
	enaA==
MIME-Version: 1.0
X-Received: by 10.58.227.198 with SMTP id sc6mr5728630vec.59.1372432294590;
	Fri, 28 Jun 2013 08:11:34 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Fri, 28 Jun 2013 08:11:34 -0700 (PDT)
Received: by 10.220.195.201 with HTTP; Fri, 28 Jun 2013 08:11:34 -0700 (PDT)
In-Reply-To: <51CD8C13.2070409@windriver.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
	<CANyK_8eBqvC7nSKzE8Dg2imQ31+_9RdGqB5_GbuKB6YSaHw04w@mail.gmail.com>
	<51CD8C13.2070409@windriver.com>
Date: Fri, 28 Jun 2013 16:11:34 +0100
X-Google-Sender-Auth: IO9_hovi1fqE0oQMIA-5razjf68
Message-ID: <CANyK_8eND7_B2N62z2GC-ieHFF0=zJ8vnSi-Gv6Rq7ht9qdHBw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 15:11:34 -0000
Content-Type: multipart/alternative; boundary=047d7bd6bf8265bfcd04e0384b96

--047d7bd6bf8265bfcd04e0384b96
Content-Type: text/plain; charset=ISO-8859-1

On 28 Jun 2013 14:17, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> On 6/28/13 5:20 AM, Paul Barker wrote:
>>
>> This picks out the current version of make in Arch Linux as broken
>> despite it having a patch for bug #30612. I'm not sure if this is
>> intended, could be that the applied patch isn't a complete fix. I
>> don't have time to dig into this, just thought it'd be useful to you
>> to know.
>
>
> This is exactly why the check is being done.  From what I found there are
a number of make versions on various distros that only have partial fixes
for bug 30612.
>
> For the RedHat/Fedora bug I filed, see:
>  https://bugzilla.redhat.com/show_bug.cgi?id=975597
>
> The test case, and a patch to the missing commit are listed.
>
>
>
http://git.savannah.gnu.org/cgit/make.git/commit/?id=b06b8c64a29a5ba3a8daecd829fa2f98d42cb285
>
>
>> If you know what fix you're looking for, the applied patches and build
>> script can be seen at
>>
https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/make
>
>
> Looking at that list, it appears the commit referenced above is indeed
the one missing.
>

I'll email the relevant people within arch linux later. Most of my
important builds are done on Ubuntu server 12.04 anyway.

Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--047d7bd6bf8265bfcd04e0384b96
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 28 Jun 2013 14:17, &quot;Mark Hatle&quot; &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 6/28/13 5:20 AM, Paul Barker wrote:<br>
&gt;&gt;<br>
&gt;&gt; This picks out the current version of make in Arch Linux as broken=
<br>
&gt;&gt; despite it having a patch for bug #30612. I&#39;m not sure if this=
 is<br>
&gt;&gt; intended, could be that the applied patch isn&#39;t a complete fix=
. I<br>
&gt;&gt; don&#39;t have time to dig into this, just thought it&#39;d be use=
ful to you<br>
&gt;&gt; to know.<br>
&gt;<br>
&gt;<br>
&gt; This is exactly why the check is being done. =A0From what I found ther=
e are a number of make versions on various distros that only have partial f=
ixes for bug 30612.<br>
&gt;<br>
&gt; For the RedHat/Fedora bug I filed, see:<br>
&gt; =A0<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D975597">ht=
tps://bugzilla.redhat.com/show_bug.cgi?id=3D975597</a><br>
&gt;<br>
&gt; The test case, and a patch to the missing commit are listed.<br>
&gt;<br>
&gt;<br>
&gt; <a href=3D"http://git.savannah.gnu.org/cgit/make.git/commit/?id=3Db06b=
8c64a29a5ba3a8daecd829fa2f98d42cb285">http://git.savannah.gnu.org/cgit/make=
.git/commit/?id=3Db06b8c64a29a5ba3a8daecd829fa2f98d42cb285</a><br>
&gt;<br>
&gt;<br>
&gt;&gt; If you know what fix you&#39;re looking for, the applied patches a=
nd build<br>
&gt;&gt; script can be seen at<br>
&gt;&gt; <a href=3D"https://projects.archlinux.org/svntogit/packages.git/tr=
ee/trunk?h=3Dpackages/make">https://projects.archlinux.org/svntogit/package=
s.git/tree/trunk?h=3Dpackages/make</a><br>
&gt;<br>
&gt;<br>
&gt; Looking at that list, it appears the commit referenced above is indeed=
 the one missing.<br>
&gt;</p>
<p dir=3D"ltr">I&#39;ll email the relevant people within arch linux later. =
Most of my important builds are done on Ubuntu server 12.04 anyway.</p>
<p dir=3D"ltr">Paul Barker</p>
<p dir=3D"ltr">Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbar=
ker.me.uk</a><br>
<a href=3D"http://www.paulbarker.me.uk">http://www.paulbarker.me.uk</a></p>

--047d7bd6bf8265bfcd04e0384b96--
