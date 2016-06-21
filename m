Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9BB612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:01:41 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id mu6so25766399obc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/+It29m/2tXDN2ISu/9Ultnps3RPJLCswkaNvcTmnB8=;
	b=hvvXi/hl3ygIp1ecL0J60GPYdLS9+hg46Rk8NTLJAbhaDurZNY2kv8aSUYriX3f6KJ
	FkxXeP8YXbmZCm6L/HfdQRCPO3IGmIl0RCMseuESSqIuybYDlNCr4KNR7UE+0EU4pX48
	tyRcJ4hrx6NF9Y13qtSGl2jZ759I0DI3YNmPFLdnWIjBglr96HAXVHpE0tMXuJWHHAg3
	+UEgxmTgozNYWHz3Hp7nXiiqyXLlO11lEHEqnDm0XC0MRmlD7dhXCytMacTnkNERPaHw
	Ced5PFdzE8LX9tYDV3p2mk7x2iZwazEpee+ohLyIqEMl8YBjwv0XLFjqemey+qRnsvWC
	uGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/+It29m/2tXDN2ISu/9Ultnps3RPJLCswkaNvcTmnB8=;
	b=ELsvEr3kWGUMBPzT/99Yodu6/VuV+BwuqmCwcFRXVr6JHWMIZBepuIL3YMBcZXulA5
	uPHqc3qcpe6s9vh0umalKofpGE2wIXkR1i+AbavUitqReO6yxpi+mcdlJiq7QYa3pIhy
	bvzegqeZPXThwetCouQZU6+Sd3WsNotet8hSYdTfFrRYAuh3e/PiDuz50XY+MfhOFmst
	1bXFxgTNimJskJcISxv4ASJiuefo6jj8lLnMrfa5lTZzoSI9EecJO8hKRNxjncm2DAbB
	JDS8vpZIebzNcP3CJO+z1WrvjW1bPdK2/qV9vUchG7C2jtzNkvsSCnMlNQwJgFyxJnZF
	QO1w==
X-Gm-Message-State: ALyK8tIE4LQtUtw3LSBXzTTNFsqmB3/QgXsc6k13iPjmEzSR46j2hZxtw7gYhzLIEo2a1Sa13fb3/TBaXiZ4o81R
X-Received: by 10.157.14.174 with SMTP id 43mr14928022otj.83.1466521297480;
	Tue, 21 Jun 2016 08:01:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Tue, 21 Jun 2016 08:01:07 -0700 (PDT)
In-Reply-To: <1466519971-5127-2-git-send-email-ross.burton@intel.com>
References: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
	<1466519971-5127-2-git-send-email-ross.burton@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 21 Jun 2016 18:01:07 +0300
Message-ID: <CAHiDW_HTZj7dQVbECfBBWWa8Cr-X69o4qvGZ3JRZ5116wqQXUQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oeqa/sdk: remove buildsudoku test
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
X-List-Received-Date: Tue, 21 Jun 2016 15:01:43 -0000
Content-Type: multipart/alternative; boundary=001a113db4ba08b4840535cb19f9

--001a113db4ba08b4840535cb19f9
Content-Type: text/plain; charset=UTF-8

On 21 June 2016 at 17:39, Ross Burton <ross.burton@intel.com> wrote:

> This application needs GTK+ 2 which we're trying to move away from for Sato
> images.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/sdk/buildsudoku.py | 26 --------------------------
>  1 file changed, 26 deletions(-)
>  delete mode 100644 meta/lib/oeqa/sdk/buildsudoku.py
>

There's another similar looking (but not identical) test in
 meta/lib/oeqa/runtime/buildsudoku.py

 - Jussi



> diff --git a/meta/lib/oeqa/sdk/buildsudoku.py
> b/meta/lib/oeqa/sdk/buildsudoku.py
> deleted file mode 100644
> index 5abbbb8..0000000
> --- a/meta/lib/oeqa/sdk/buildsudoku.py
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -from oeqa.oetest import oeSDKTest, skipModule
> -from oeqa.utils.decorators import *
> -from oeqa.utils.targetbuild import SDKBuildProject
> -
> -def setUpModule():
> -    if not oeSDKTest.hasPackage("gtk+"):
> -        skipModule("Image doesn't have gtk+ in manifest")
> -
> -class SudokuTest(oeSDKTest):
> -
> -    @classmethod
> -    def setUpClass(self):
> -        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir +
> "/sudoku/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
> -                        "
> http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2
> ")
> -        self.project.download_archive()
> -
> -    def test_sudoku(self):
> -        self.assertEqual(self.project.run_configure(), 0,
> -                        msg="Running configure failed")
> -
> -        self.assertEqual(self.project.run_make(), 0,
> -                        msg="Running make failed")
> -
> -    @classmethod
> -    def tearDownClass(self):
> -        self.project.clean()
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113db4ba08b4840535cb19f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 June 2016 at 17:39, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">This application needs GTK+ 2 which we=
&#39;re trying to move away from for Sato<br>
images.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/sdk/buildsudoku.py | 26 --------------------------<br>
=C2=A01 file changed, 26 deletions(-)<br>
=C2=A0delete mode 100644 meta/lib/oeqa/sdk/buildsudoku.py<br></blockquote><=
div><br></div><div>There&#39;s another similar looking (but not identical) =
test in =C2=A0meta/lib/oeqa/runtime/buildsudoku.py</div><div><br></div><div=
>=C2=A0- Jussi</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
diff --git a/meta/lib/oeqa/sdk/buildsudoku.py b/meta/lib/oeqa/sdk/buildsudo=
ku.py<br>
deleted file mode 100644<br>
index 5abbbb8..0000000<br>
--- a/meta/lib/oeqa/sdk/buildsudoku.py<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-from oeqa.oetest import oeSDKTest, skipModule<br>
-from oeqa.utils.decorators import *<br>
-from oeqa.utils.targetbuild import SDKBuildProject<br>
-<br>
-def setUpModule():<br>
-=C2=A0 =C2=A0 if not oeSDKTest.hasPackage(&quot;gtk+&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 skipModule(&quot;Image doesn&#39;t have gtk+ i=
n manifest&quot;)<br>
-<br>
-class SudokuTest(oeSDKTest):<br>
-<br>
-=C2=A0 =C2=A0 @classmethod<br>
-=C2=A0 =C2=A0 def setUpClass(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.project =3D SDKBuildProject(oeSDKTest.tc.=
sdktestdir + &quot;/sudoku/&quot;, oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<a href=3D"http://downloads.sourceforge.net/project/sudoku=
-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2" rel=3D"n=
oreferrer" target=3D"_blank">http://downloads.sourceforge.net/project/sudok=
u-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2</a>&quot=
;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.project.download_archive()<br>
-<br>
-=C2=A0 =C2=A0 def test_sudoku(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.project.run_configure(),=
 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msg=3D&quot;Running configure failed&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.project.run_make(), 0,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msg=3D&quot;Running make failed&quot;)<br>
-<br>
-=C2=A0 =C2=A0 @classmethod<br>
-=C2=A0 =C2=A0 def tearDownClass(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.project.clean()<br>
<span class=3D""><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113db4ba08b4840535cb19f9--
