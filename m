Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ru5I6-0004Ba-QG
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 17:50:14 +0100
Received: by werc1 with SMTP id c1so4246209wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 08:42:14 -0800 (PST)
Received: by 10.216.133.213 with SMTP id q63mr2060994wei.49.1328460134186;
	Sun, 05 Feb 2012 08:42:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.100.82 with HTTP; Sun, 5 Feb 2012 08:41:54 -0800 (PST)
X-Originating-IP: [79.117.107.69]
In-Reply-To: <4F2C860C.3020006@linux.intel.com>
References: <1328282644-4459-1-git-send-email-andrei@gherzan.ro>
	<4F2C860C.3020006@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 5 Feb 2012 18:41:54 +0200
Message-ID: <CAK18fxGND2uPFFmYaGV1o6zeQJUQXg9pFBUUrqb-z4-1gfTcgA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQl5oZ2c+E2LCj6bTPItcgXJmnIYGLomAEQ8L/HQ/FbjygOAAUTBXe490mWGgSjrhK9URgQv
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] js: Update to v1.8.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Feb 2012 16:50:14 -0000
Content-Type: multipart/alternative; boundary=0016e6dceafd657e3504b83a3aee

--0016e6dceafd657e3504b83a3aee
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 4, 2012 at 03:12, Saul Wold <sgw@linux.intel.com> wrote:

>
> There seems to be a number of issues with this recipe, the
> LIC_FILE_CHKSUMs do not match, I did not see any DEPENDS, so I am not sure
> if you have all the dependencies correct.
>
> It did not compile, maybe I got a different version than you did, I am
> trying to build it on an x86-64 machine.
>
> Could you look into this please.
>
> Thanks
>        Sau!
>

I used the md5sum of the whole cpp file and not only for the LICENSE part
of it. Anyway, i replaced that with the correct one but as i see, this
change wasn't in this patch.

About DEPENDS, I couldn't find any dependencies. In order to check this i
baked js in a new build without having anything in DEPENDS and the
package succeeded. (bitbake js)

This should be ok: http://git.gherzan.ro/yocto-dev/changeset/b21940194b78

--0016e6dceafd657e3504b83a3aee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Sat, Feb 4, 2012 at 03:12, Saul Wold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
There seems to be a number of issues with this recipe, the LIC_FILE_CHKSUMs=
 do not match, I did not see any DEPENDS, so I am not sure if you have all =
the dependencies correct.<br>
<br>
It did not compile, maybe I got a different version than you did, I am tryi=
ng to build it on an x86-64 machine.<br>
<br>
Could you look into this please.<br>
<br>
Thanks<br>
 =A0 =A0 =A0 =A0Sau!<br>
</blockquote><div><br></div><div>I used the md5sum of the whole cpp file an=
d not only for the LICENSE part of it. Anyway, i replaced that with the cor=
rect one but as i see, this change wasn&#39;t in this patch.</div><div>

<br></div><div>About DEPENDS, I=A0couldn&#39;t=A0find any dependencies. In =
order to check this i baked js in a new build without having anything in DE=
PENDS and the package=A0succeeded. (bitbake js)=A0</div><div><br></div><div=
>This should be ok:=A0<a href=3D"http://git.gherzan.ro/yocto-dev/changeset/=
b21940194b78">http://git.gherzan.ro/yocto-dev/changeset/b21940194b78</a></d=
iv>

<div><br></div><div><br></div></div>

--0016e6dceafd657e3504b83a3aee--
