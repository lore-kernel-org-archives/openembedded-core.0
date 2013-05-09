Received: from mail-lb0-f182.google.com ([209.85.217.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UaZw7-0007gR-76
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 01:07:43 +0200
Received: by mail-lb0-f182.google.com with SMTP id r11so3556973lbv.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=I1L6Ujyz0Ixx5ZiKwWOUOw+QLpTXsNt+TPn6WCXhVEw=;
	b=PCEPcoPKD/ytLZ+iHTjQ7wDU24wolLVprlzepedvZHMGRqt7ZGc1hZnbQnK0FlguL2
	d1T3VEqijyR4QllWgGPYez7Ong9/UinjXy3KCMDPAZy0lM2SyvUFyCccaBKkn+ko/qKT
	RI0Eg8uRyOwPz34/qb28blUULUEWEKgC3XS9MxB/oeSDpEYxZbYlvHpR9shNkHWJW78g
	5FlN2rNywvFubrkeimdqeg9rI6Piaf51DKx9WczLoFCTS6ged3H1C22/a4hWF4on19j9
	MMwaZyUfIGg9iNdgutlOX+hOuQap4J2GJ2/Jm1liwckn/EnL0Ko95a141+CKWC66VOEu
	P1ow==
X-Received: by 10.152.21.193 with SMTP id x1mr6438530lae.26.1368139778848;
	Thu, 09 May 2013 15:49:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.141.74 with HTTP; Thu, 9 May 2013 15:49:18 -0700 (PDT)
In-Reply-To: <edbe33f45ad5f07beb7ffdc38bb95f424bb2ab3a.1368116511.git.paul.eggleton@linux.intel.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
	<edbe33f45ad5f07beb7ffdc38bb95f424bb2ab3a.1368116511.git.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 May 2013 15:49:18 -0700
X-Google-Sender-Auth: YVL7E1pCFkKq4vZXyDK1bccgFqg
Message-ID: <CABcZAN=Hs5B5Eq8iJs=+caTFBV+xLwQbjdo+2tp68MKTS5qqvw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] classes/image: show an error on invalid IMAGE_FEATURES
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
X-List-Received-Date: Thu, 09 May 2013 23:07:43 -0000
Content-Type: multipart/alternative; boundary=089e0158b690857df704dc50dd20

--089e0158b690857df704dc50dd20
Content-Type: text/plain; charset=UTF-8

On Thu, May 9, 2013 at 9:24 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> If the user specifies an invalid feature in IMAGE_FEATURES, show an
> error during parsing. Valid IMAGE_FEATURES are drawn from
> PACKAGE_GROUP_ definitions, COMPLEMENTARY_GLOBS and a new 'validitems'
> varflag on IMAGE_FEATURES (so that additional non-package group features
> can be added elsewhere.)
>
> Implements [YOCTO #3308].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>

Hmm, maybe we should add this sort of valid item in a list checking to
typecheck.bbclass, or enhance the list type in oe.types to do it there, so
we'd have a general mechanism for this.
-- 
Christopher Larson

--089e0158b690857df704dc50dd20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 9, 2013 at 9:24 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":s3p">If the user specifies an in=
valid feature in IMAGE_FEATURES, show an<br>
error during parsing. Valid IMAGE_FEATURES are drawn from<br>
PACKAGE_GROUP_ definitions, COMPLEMENTARY_GLOBS and a new &#39;validitems&#=
39;<br>
varflag on IMAGE_FEATURES (so that additional non-package group features<br=
>
can be added elsewhere.)<br>
<br>
Implements [YOCTO #3308].<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;</div></blockquote></div><br>Hm=
m, maybe we should add this sort of valid item in a list checking to typech=
eck.bbclass, or enhance the list type in oe.types to do it there, so we&#39=
;d have a general mechanism for this.<br>

-- <br>Christopher Larson</div></div>

--089e0158b690857df704dc50dd20--
