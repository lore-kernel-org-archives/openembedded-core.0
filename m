Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC3460684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 11:12:42 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id n125so30401063vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 04:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FvUSdaff8IoecdlHgsHu/MutHGjFBGRJEoqBzIpjlDQ=;
	b=RcqfCikdS/5kgjDvLd02OTnHlAAwLvNb3gmWtINCjwH8MFSZz9ii0/vxN051aBMeGo
	+5AuLUBTqdf2isy+vCczadLSZ/CY8OIUeQ+43+1gbiKUOsfLvGHY5XZffQ6JV32sLRgP
	BUawvE92YnX3SM+uLpqzj3NY2UmZIlVjM2VRAECdsMIvz+fM/ue2VpFjCKvjNhoa+yhb
	RSCu4zaP0gPRlPfZqEVKVQwRoYk8Dk5Z1JVfIwHqmDnwKbuMWYvzJPfvVNu9JpOJGT4f
	CnPpkKDi822KA7gbKSEy0zJSDR5YY4I35yQJkp+upg816FTO9rCVURuaMuZtjjZXSnb1
	/8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FvUSdaff8IoecdlHgsHu/MutHGjFBGRJEoqBzIpjlDQ=;
	b=dMHCTCOa3IzNOEDbLjaYczJ6ouw5n+eweYrdLmWGwanZbR8opq/thjzX+O/nX9tIQY
	/9iP9qD7OdAU0JrllfOxUdysBE9A1Uc655wwgRKhECKdesH1BhmUOHeYK4l23CoA38jN
	iK9JglWqlnzUxk+H3bgsCScoQWHK0MDFCWPx9eWiI/GuuKx6hphBDeLWmZGrqGzVTRm0
	tzgpyVfLe8+7XW13D7DkYP6h/pYM8P60Rw6+g73i5eDUbC1S2EeIfEjyDedP7lRF4jvv
	tCDyZe0WCJzeLOKYZXPZQYgmhpssUKE9yZGusssJkqXOE46diUlgEcJpC3udvf5chbTl
	PwyQ==
X-Gm-Message-State: AHYfb5hQ63BZKRF2+WhSd/5hxoLmkhg8wdLY9Ld9sfujocGtX5HLPZE4
	ET2HM1JCLNDBv+S53v8JKdE+d5oOIAxu
X-Received: by 10.31.92.133 with SMTP id q127mr7828451vkb.212.1502709162390;
	Mon, 14 Aug 2017 04:12:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 14 Aug 2017 04:12:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2017 13:12:41 +0200
Message-ID: <CA+chaQfG+GnAii57UEpXO_MTi4JYBeAGtMLMY_cXk6qmNcTE-Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: errors.yoctoproject.org refusing connections?
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
X-List-Received-Date: Mon, 14 Aug 2017 11:12:42 -0000
Content-Type: multipart/alternative; boundary="001a114e1ac4d33d910556b4bd76"

--001a114e1ac4d33d910556b4bd76
Content-Type: text/plain; charset="UTF-8"

Hi,


recently couple uploads to errors.yoctoproject.org end with
"Connection reset by peer":


NOTE: Uploading the report
/home/jenkins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20170813141910.txt
to errors.yoctoproject.org:80

WARNING: Server connection failed [Errno 104] Connection reset by peer
NOTE: Build completion summary:


is there some issue on the server or just regular maintenance/upgrades
of the application which I just happen to hit quite often? I wasn't
seeing so many errors until recently (last month or so).


Regards,

--001a114e1ac4d33d910556b4bd76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">Hi,</pre><pre class=3D"gmail-c=
onsole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wra=
p:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size=
:14px"><br></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">recently couple uploads to <a =
href=3D"http://errors.yoctoproject.org">errors.yoctoproject.org</a> end wit=
h &quot;Connection reset by peer&quot;:</pre><pre class=3D"gmail-console-ou=
tput" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-w=
ord;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><b=
r></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;=
white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;=
color:rgb(51,51,51);font-size:14px">NOTE: Uploading the report /home/jenkin=
s/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20170813141910.=
txt to <a href=3D"http://errors.yoctoproject.org:80">errors.yoctoproject.or=
g:80</a><br></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px">WARNING: Server connection fa=
iled [Errno 104] Connection reset by peer
NOTE: Build completion summary:</pre><pre class=3D"gmail-console-output" st=
yle=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;marg=
in-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><br></pre>=
<pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;white-sp=
ace:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rg=
b(51,51,51);font-size:14px">is there some issue on the server or just regul=
ar maintenance/upgrades of the application which I just happen to hit quite=
 often? I wasn&#39;t seeing so many errors until recently (last month or so=
).</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;=
white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;=
color:rgb(51,51,51);font-size:14px"><br></pre><pre class=3D"gmail-console-o=
utput" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-=
word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">R=
egards,</pre></div>

--001a114e1ac4d33d910556b4bd76--
