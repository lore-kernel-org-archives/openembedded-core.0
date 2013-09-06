Return-Path: <jc@vtkloud.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 25F6661867
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 20:31:53 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf1so3820609pab.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 13:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:date:message-id
	:subject:from:to:content-type;
	bh=CQNq/56kfmZM8ZmmnUf18j75zQnPJin2NPaI+MBGD4E=;
	b=GW/hRTkqnnQIf3K39bpcyVStIx6ps/+8p9Y9WkpYhzXP9hDdfmEp2u8dgN/cVtQVg4
	2bijSWC/XEYI9A/tdPmVtTPiZsQ32ZcAYUXYpyb6gh0a1Cux65X2p6uS1gRL8qnaXFRI
	B+NOoqbuk5v44vWre9M8mkb3/b64sVlTeJNbK6/yMICiYeqXjeTIg43Dh+AR21bHb51i
	b5hJHp7CxiC2zBcedtrzZXnu3ZefZFEt1yiuY6uv+tonpVnI+3vs5rUHpbDMG+10iuYU
	05LxvYDNQBMQduuslDX/fMcsdizOpWSE1IaPJBCY0SnEAkTup0kzjV86Eikzbq4UmGvM
	n6iw==
X-Gm-Message-State: ALoCoQkXFoeZ62xPGi/CohATPJJ/YXGbL5Z22BQWcvFdG6nbv1DY/sZY57NoJqwvzfp7WqkfEjlO
MIME-Version: 1.0
X-Received: by 10.67.23.227 with SMTP id id3mr5986405pad.101.1378499515091;
	Fri, 06 Sep 2013 13:31:55 -0700 (PDT)
Sender: jc@vtkloud.com
Received: by 10.66.181.169 with HTTP; Fri, 6 Sep 2013 13:31:55 -0700 (PDT)
X-Originating-IP: [88.167.231.94]
Date: Fri, 6 Sep 2013 22:31:55 +0200
X-Google-Sender-Auth: ema8Xxy2fN1NHreNqIgJ2R0xce0
Message-ID: <CAGzCC=86twuXd4_BoaZ8Fwd_OF+FnJvqggxhVXPO0jDyzv9Zew@mail.gmail.com>
From: JC <jcv@voxtok.com>
To: openembedded-core@lists.openembedded.org
Subject: problem with installing ruby-dev, and missing libcrypto ?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: jcv@voxtok.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 20:31:53 -0000
Content-Type: multipart/alternative; boundary=001a1134417eeb9dc804e5bced70

--001a1134417eeb9dc804e5bced70
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to install ruby-dev (in order to be able to apply some passenger
features), and Passenger requires ruby-dev

ruby-dev has indeed been built (i'm working with yoctoProject) but when I'm
trying to install it, I can't:

root@qemuarm:~# smart install ruby-dev
rpmdb: BDB0113 Thread/proc
Computing transaction...
error: Can't install ruby-dev-1.9.3+p194-r1.0@**armv5te: no package
provides libcrypto-dev

(smart connects to a local repo which is my tmp/work/rpms directory)

And of course, libcrypto-dev is _not_ present neither in meta-ruby, nor
anywhere else (as far as I can search in
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=crypto )

I wonder how ruby-dev has been compiled if libcrypto is not here ? And
how/why smart could have this package and not the other?

and more importantly, how can I solve the issue ? How can I make sure
libcryto is also generated (or not deleted?) during build process?

I'm working on the qemuarm device, but I'm not sure how much the problem is
bound to it or could be reproduced on other targets.

Regards
Jay

--001a1134417eeb9dc804e5bced70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi,</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">I&#39;m trying to install ruby-dev (i=
n order to be able to apply some passenger features), and Passenger require=
s ruby-dev</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">ruby-dev has indeed been built (=
i&#39;m working with yoctoProject) but when I&#39;m trying to install it, I=
 can&#39;t:</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
>
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">root@qemuarm:~# smart install ru=
by-dev</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><spa=
n style=3D"font-family:arial,sans-serif;font-size:13px">rpmdb: BDB0113 Thre=
ad/proc</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">Computing trans=
action...</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><=
span style=3D"font-family:arial,sans-serif;font-size:13px">error: Can&#39;t=
 install ruby-dev-1.9.3+p194-r1.0@</span><u style=3D"font-family:arial,sans=
-serif;font-size:13px"></u><span style=3D"font-family:arial,sans-serif;font=
-size:13px">armv5</span><span style=3D"font-family:arial,sans-serif;font-si=
ze:13px">te: no package provides libcrypto-dev</span><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px">
<br>(smart connects to a local repo which is my tmp/work/rpms directory)<br=
><div><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">And of course, libcrypto-d=
ev is _not_ present neither in meta-ruby, nor anywhere else (as far as I ca=
n search in=A0</span><a href=3D"http://layers.openembedded.org/layerindex/b=
ranch/master/recipes/?q=3Dcrypto">http://layers.openembedded.org/layerindex=
/branch/master/recipes/?q=3Dcrypto</a><span style=3D"font-family:arial,sans=
-serif;font-size:13px">=A0)</span><div>
<span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span></di=
v><div><span style=3D"font-family:arial,sans-serif;font-size:13px">I wonder=
 how ruby-dev has been compiled if libcrypto is not here ? And how/why smar=
t could have this package and not the other?=A0</span></div>
<div><span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span=
></div><div><span style=3D"font-family:arial,sans-serif;font-size:13px">and=
 more importantly, how can I solve the issue ? How can I make sure libcryto=
 is also generated (or not deleted?) during build process?</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<br><span style=3D"font-family:arial,sans-serif;font-size:13px">I&#39;m wor=
king on the qemuarm device, but I&#39;m not sure how much the problem is bo=
und to it or could be reproduced on other targets.</span><br style=3D"font-=
family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">Regards</span><br style=3D"font-=
family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sa=
ns-serif;font-size:13px">Jay</span><br>
</div></div></div>

--001a1134417eeb9dc804e5bced70--
