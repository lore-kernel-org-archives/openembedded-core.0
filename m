Subject: Navite eSDK programs link error
To: openembedded-core@lists.openembedded.org
From: "Gustavo Plaza" <gplaza@gmv.com>
X-Originating-Location: Valladolid, Castille and León, ES (62.42.16.68)
X-Originating-Platform: Windows Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 Jan 2021 07:31:06 -0800
Message-ID: <H2Le.1610638266429349036.y6Si@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mx5yVylOxPrxKGutE3U0"

--mx5yVylOxPrxKGutE3U0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I have built eSDK=C2=A0 for yocto sumo correctly. After the installation (=
not installed in default target directory) I execute
cd=C2=A0 <path to eSDK>
source environment-setup-armv7at2hf-neon-fslc-linux-gnueabi

but when I try to execute the cmake installed in the eSDK (<path to eSDK>/=
sysroots/x86_64-fslcsdk-linux/usr/bin/cmake) I get the error:
bash: <path to eSDK>/sysroots/x86_64-fslcsdk-linux/usr/bin/cmake: No such =
file or directory

If I run the following command:
strings <path to eSDK>/sysroots/x86_64-fslcsdk-linux/usr/bin/cmake | less

It shows the following library but the eSDK is not installed in this direc=
tory.
/opt/fslc-x11/2.5.3/sysroots/x86_64-fslcsdk-linux/lib/ld-linux-x86-64.so.2

The same error occurs when I try to execute other program from <path to eS=
DK>/sysroots/x86_64-fslcsdk-linux/usr/bin/

This error appears when I add "inherit populate_sdk_qt5" to my image.

Best regards.

--mx5yVylOxPrxKGutE3U0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I have built eSDK&nbsp; for yocto sumo correctly. After t=
he installation (not installed in default target directory) I execute <br /=
>cd&nbsp; &lt;path to eSDK&gt;<br />source environment-setup-armv7at2hf-neo=
n-fslc-linux-gnueabi<br /><br />but when I try to execute the cmake install=
ed in the eSDK (&lt;path to eSDK&gt;/sysroots/x86_64-fslcsdk-linux/usr/bin/=
cmake) I get the error:<br />
<div>bash: &lt;path to eSDK&gt;/sysroots/x86_64-fslcsdk-linux/usr/bin/cmak=
e: No such file or directory</div>
<div><br />If I run the following command:<br />strings &lt;path to eSDK&g=
t;/sysroots/x86_64-fslcsdk-linux/usr/bin/cmake | less&nbsp;<br /><br />It s=
hows the following library but the eSDK is not installed in this directory.=
<br />/opt/fslc-x11/2.5.3/sysroots/x86_64-fslcsdk-linux/lib/ld-linux-x86-64=
.so.2<br /><br />The same error occurs when I try to execute other program =
from &lt;path to eSDK&gt;/sysroots/x86_64-fslcsdk-linux/usr/bin/<br /><br /=
>This error appears when I add "inherit populate_sdk_qt5" to my image.</div=
>
<br />Best regards.

--mx5yVylOxPrxKGutE3U0--
