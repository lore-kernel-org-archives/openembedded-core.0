Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1931C77A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:23:25 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id d10so57491607qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Egaq8Db7vNmkhHYWhFrlqs9pyScp7Ul7O07tmV/g1Fg=;
	b=SnYmsSf/dCPqL7UPJqSF7JSZtXk/9f0133BjJqdr1frm0ODpNG3VU+6nbzho36p7eU
	qxfue66iN1LJrBvl5jmLzaH42I97MciePJtpdpIO0HY1jlFu9IfbcsVySXQdPEMf6JC6
	csbuCpHKgdaZkAs+zPwyrCUSh9kdGZwED5x2WvJMYIaQ6ZJeT92dosnI0LenJKbYUyRK
	k8K9wUuRWkpNn2MNKc809u3yL6kgeDR/qhIiMm/cPMbboDfH+xHhhaYqYKCn8BU2C+1w
	tXGOrE0fRxGhlbOyMonyUwzhB5aR61niDVkK01GViQpSSfm8vZ1+zO4gQPmqcwIVKsBb
	uWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Egaq8Db7vNmkhHYWhFrlqs9pyScp7Ul7O07tmV/g1Fg=;
	b=a+HiTQKdVOCjhINIBCgpfq4lL7MueZ+WPKFU/2TIpFgEV1+yB8XbXs5b0hiL4UO0q5
	Wz5wOR3GThILPB7VybcJUybc35WSPFekfGcQ3bhOc6GEht1/TFh6fEwmy3b508+OqiXT
	Zy9Jk/5GhhZnOqqaLQ7SxE6X2zfewTsI6mkyLj4Q+2pmCgkNHZdltPkwhM/GKp/vWR88
	0UkJQe34zNQSMtXp09pOQkcxBIPvQwyj5e0MtL9R2imauQekZw7tc/I65N8WbDBJZN4B
	dlN27jN0Ksk7SMsUjC6HZJVBHSDS9OgOdUen9ni7zbASwMWitOZMnj8MRD8jM9Fn0EXE
	Psgg==
X-Gm-Message-State: AFeK/H3hD+EkIc6HMhcoN7wwIs+AJDSPJVFuTcXzui9rPsBu9GXTi6v3IFWNrV/WFONQABtzK99fKGTfY9KHhRej
X-Received: by 10.55.108.195 with SMTP id h186mr28257078qkc.36.1490703806848; 
	Tue, 28 Mar 2017 05:23:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 28 Mar 2017 05:23:06 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703280816090.29290@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
	<CAJTo0LYhHdYHb8ecGCuF_L=Cf_29a0pW3_1yk7di402C3mObLA@mail.gmail.com>
	<alpine.LFD.2.20.1703280816090.29290@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Mar 2017 13:23:06 +0100
Message-ID: <CAJTo0LZcxahN6dOTp9sSZ4uMzGVwi+n1OqfdvQnYaHk5q+5JKw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
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
X-List-Received-Date: Tue, 28 Mar 2017 12:23:26 -0000
Content-Type: multipart/alternative; boundary=001a114fe79adf7ca8054bc98639

--001a114fe79adf7ca8054bc98639
Content-Type: text/plain; charset=UTF-8

On 28 March 2017 at 13:18, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   ok, i thought i knew what you meant but now, i'm just drawing a
> blank. in what way is that not testing for a non-empty string as the
> value of D? what painfully obvious clue am i missing?
>

The gconf_postinst is shell to be executed in the package management
postinst code, so either at rootfs time, or first boot for the ones that
didn't work at rootfs, or when the package is installed on the target.

The postinst can tell those apart by inspecting the value of the
environment variable $D, which if set means the postinst is running on the
host in the rootfs context, so should prefix all paths with $D.

$D *needs* to be fetched from the environment when the script is executing,
and using ${D} will result in *bitbake* expanding it whilst writing the
package, where it is the path to the package staging directory.

(yes, using a different variable name that wasn't overloaded wouldn't cause
this problem)

Ross

--001a114fe79adf7ca8054bc98639
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 March 2017 at 13:18, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ms" cla=
ss=3D"a3s aXjCH m15b14db286875907">=C2=A0 ok, i thought i knew what you mea=
nt but now, i&#39;m just drawing a<br>
blank. in what way is that not testing for a non-empty string as the<br>
value of D? what painfully obvious clue am i missing?</div></blockquote></d=
iv><br>The gconf_postinst is shell to be executed in the package management=
 postinst code, so either at rootfs time, or first boot for the ones that d=
idn&#39;t work at rootfs, or when the package is installed on the target.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The pos=
tinst can tell those apart by inspecting the value of the environment varia=
ble $D, which if set means the postinst is running on the host in the rootf=
s context, so should prefix all paths with $D.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">$D *needs* to be fetched from the =
environment when the script is executing, and using ${D} will result in *bi=
tbake* expanding it whilst writing the package, where it is the path to the=
 package staging directory.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">(yes, using a different variable name that wasn&#39;t=
 overloaded wouldn&#39;t cause this problem)</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114fe79adf7ca8054bc98639--
