Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id EB5AF6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:11:38 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o67so215171887iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zsEnNPOeQPLWFpBWj0f8GynBhd3KsKbXswi2lHiEUPc=;
	b=iuaEdVvmPDVjN17SKnKTYPqfgS30XagX/cbON6dBmXSgIz8q5tumt667y7rxrSETiU
	7Y2zFamVXi+sTUgQMTYSPCaVGuYM2kCW5iC1FL8J5Td7zXdoClFvpN7xeniOfhImItVu
	WXgrRqyvW1LzVunUZk6xHOixIsXJhf+uOTtAIh9RPu++3svwsq4oz8sqWCoCpT+P+N8R
	sCVTNljTOFiQQGdwe+Xfsy6WjfhSfQtANaWfumPo8VUJ/sOxeRD0orRKQOdTTkeZl+sy
	nkIohdBYyanfpC6mPP4vvURo1fZVLKs5VLcB8Fd/gfv88Wwy2T+lGXOkF15qwkJHRCBe
	n38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zsEnNPOeQPLWFpBWj0f8GynBhd3KsKbXswi2lHiEUPc=;
	b=DrzCusUC0LzD36Et2k7Y0JY6EBOuGRLvgd1Lx4EtEt5OM4kgJwQSXqksH3Irjy61yZ
	qFz5bS6ju4s8p3er+D+ol4PDfIiNdseKUZ0Gt2ZUCy5Vvs4oUroJQKLGvhUgoK05d8Au
	zT6cceZKwMZOc2PqmLz+V6E/NlPSCHzFj7deujSRWfl7xewva7j8PDrVZBHdn/q9CAFn
	Rc48fIgznB9UKHOlr/OGLZ9agh6mT0TmIUMmuu0us/927hiXHTzHjt2GSu1AqWp0qGp9
	DrzZZtItgNCq00TAaSG1RGl/6M1YinnBvpNZ1yoBo8CNU4L/CrI88GjwXDFfdTfr8SO+
	V2Jw==
X-Gm-Message-State: ALoCoQkmdBe4kd3AL76MPnwRCMxsg2iOs7KLY6LrX21jxu3RpoKHCL0ceKMfGaGxaVl9NHnzE7zYnKzt5y6pY29QnI7+LGJpen3Dw2G906HkNY+bnXgQzEY=
X-Received: by 10.107.155.209 with SMTP id d200mr34418602ioe.133.1450876299265;
	Wed, 23 Dec 2015 05:11:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 05:11:19 -0800 (PST)
In-Reply-To: <e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
	<e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 13:11:19 +0000
Message-ID: <CAJTo0LaCS-MeOUOUiBPNbhuBry3b5fo-5eR-JtREigUyav_39g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] nss: update to 3.21
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
X-List-Received-Date: Wed, 23 Dec 2015 13:11:39 -0000
Content-Type: multipart/alternative; boundary=001a114034026e5f0f0527907601

--001a114034026e5f0f0527907601
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 15:08, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} | 6 +++---
>

Failed on the autobuilder in a number of interesting ways:

In file included from ssl_agent_unittest.cc:13:
databuffer.h: In constructor 'nss_test::DataBuffer::DataBuffer()':
databuffer.h:25: error: 'nullptr' was not declared in this scope
databuffer.h: In constructor 'nss_test::DataBuffer::DataBuffer(const
uint8_t*, size_t)':
databuffer.h:26: error: 'nullptr' was not declared in this scope
databuffer.h: In copy constructor 'nss_test::DataBuffer::DataBuffer(const
nss_test::DataBuffer&)':
databuffer.h:29: error: 'nullptr' was not declared in this scope
In file included from tls_agent.h:15,
                 from ssl_agent_unittest.cc:14:
test_io.h: In constructor 'nss_test::DummyPrSocket::DummyPrSocket(const
std::string&, nss_test::Mode)':
test_io.h:70: error: 'nullptr' was not declared in this scope
test_io.h: In member function 'void nss_test::Poller::Timer::Cancel()':
test_io.h:97: error: 'nullptr' was not declared in this scope
In file included from ssl_agent_unittest.cc:14:
tls_agent.h: In constructor
'nss_test::TlsAgentTestBase::TlsAgentTestBase(nss_test::TlsAgent::Role,
nss_test::Mode)':
tls_agent.h:247: error: 'nullptr' was not declared in this scope
../../coreconf/rules.mk:440: recipe for target
'Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/ssl_agent_unittest.o' failed
http://errors.yoctoproject.org/Errors/Details/24422/, poky-lsb on centos
hosts.


/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld:
Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/gtest/src/gtest-all.o: relocation
R_X86_64_PC32 against symbol
`_ZTVN7testing8internal24XmlUnitTestResultPrinterE' can not be used when
making a shared object; recompile with -fPIC
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld:
final link failed: Bad value
(http://errors.yoctoproject.org/Errors/Details/24411/)


install.c: In function 'Pk11Install_DoInstall': install.c:341:2: error:
call to function 'Pk11Install_Info_init' without a real prototype
[-Werror=unprototyped-calls] Pk11Install_Info_init(&installInfo); ^ In file
included from install.c:6:0: install-ds.h:246:1: note:
'Pk11Install_Info_init' was declared here Pk11Install_Info_init(); ^ cc1:
all warnings being treated as errors
http://errors.yoctoproject.org/Errors/Details/24436/, poky-lsb on opensuse
hosts

You can find the full list of failures using error.yp:
http://errors.yoctoproject.org/Errors/Search/?items=10&query=12f63cebe936b01b7d4b1a650fbb9e1c42adb344&filter=nss-native&type=recipe
for example is all nss-native fails in that build.

Ross

--001a114034026e5f0f0527907601
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 15:08, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":5v" class=3D"" style=3D"overflow:hidden">=C2=A0meta/recipes-support/<s=
pan class=3D"">nss</span>/{<a href=3D"http://nss_3.19.2.bb" rel=3D"noreferr=
er" target=3D"_blank">nss_3.19.2.bb</a> =3D&gt; <a href=3D"http://nss_3.21.=
bb" rel=3D"noreferrer" target=3D"_blank">nss_3.21.bb</a>} | 6 +++---<br></d=
iv></blockquote></div></div><div><br></div>Failed on the autobuilder in a n=
umber of interesting ways:<br><br>In file included from ssl_agent_unittest.=
cc:13:<br>databuffer.h: In constructor &#39;nss_test::DataBuffer::DataBuffe=
r()&#39;:<br>databuffer.h:25: error: &#39;nullptr&#39; was not declared in =
this scope<br>databuffer.h: In constructor &#39;nss_test::DataBuffer::DataB=
uffer(const uint8_t*, size_t)&#39;:<br>databuffer.h:26: error: &#39;nullptr=
&#39; was not declared in this scope<br>databuffer.h: In copy constructor &=
#39;nss_test::DataBuffer::DataBuffer(const nss_test::DataBuffer&amp;)&#39;:=
<br>databuffer.h:29: error: &#39;nullptr&#39; was not declared in this scop=
e<br>In file included from tls_agent.h:15,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ssl_agent_unittest.cc:14:<br>test_io=
.h: In constructor &#39;nss_test::DummyPrSocket::DummyPrSocket(const std::s=
tring&amp;, nss_test::Mode)&#39;:<br>test_io.h:70: error: &#39;nullptr&#39;=
 was not declared in this scope<br>test_io.h: In member function &#39;void =
nss_test::Poller::Timer::Cancel()&#39;:<br>test_io.h:97: error: &#39;nullpt=
r&#39; was not declared in this scope<br>In file included from ssl_agent_un=
ittest.cc:14:<br>tls_agent.h: In constructor &#39;nss_test::TlsAgentTestBas=
e::TlsAgentTestBase(nss_test::TlsAgent::Role, nss_test::Mode)&#39;:<br>tls_=
agent.h:247: error: &#39;nullptr&#39; was not declared in this scope<br>../=
../coreconf/<a href=3D"http://rules.mk:440">rules.mk:440</a>: recipe for ta=
rget &#39;Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/ssl_agent_unittest.o&#39; fa=
iled<br><a href=3D"http://errors.yoctoproject.org/Errors/Details/24422/">ht=
tp://errors.yoctoproject.org/Errors/Details/24422/</a>, poky-lsb on centos =
hosts.<br><br><br>/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x8=
6-64-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linu=
x/gcc/x86_64-poky-linux/5.3.0/ld: Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/gtes=
t/src/gtest-all.o: relocation R_X86_64_PC32 against symbol `_ZTVN7testing8i=
nternal24XmlUnitTestResultPrinterE&#39; can not be used when making a share=
d object; recompile with -fPIC<br>/home/pokybuild/yocto-autobuilder/yocto-w=
orker/nightly-x86-64-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/=
x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld: final link failed: Bad va=
lue<div>(<a href=3D"http://errors.yoctoproject.org/Errors/Details/24411/">h=
ttp://errors.yoctoproject.org/Errors/Details/24411/</a>)</div><div><br></di=
v><div><br></div>install.c: In function &#39;Pk11Install_DoInstall&#39;: in=
stall.c:341:2: error: call to function &#39;Pk11Install_Info_init&#39; with=
out a real prototype [-Werror=3Dunprototyped-calls] Pk11Install_Info_init(&=
amp;installInfo); ^ In file included from install.c:6:0: install-ds.h:246:1=
: note: &#39;Pk11Install_Info_init&#39; was declared here Pk11Install_Info_=
init(); ^ cc1: all warnings being treated as errors<div><a href=3D"http://e=
rrors.yoctoproject.org/Errors/Details/24436/">http://errors.yoctoproject.or=
g/Errors/Details/24436/</a>, poky-lsb on opensuse hosts<br></div><div><br><=
/div><div>You can find the full list of failures using error.yp: <a href=3D=
"http://errors.yoctoproject.org/Errors/Search/?items=3D10&amp;query=3D12f63=
cebe936b01b7d4b1a650fbb9e1c42adb344&amp;filter=3Dnss-native&amp;type=3Dreci=
pe">http://errors.yoctoproject.org/Errors/Search/?items=3D10&amp;query=3D12=
f63cebe936b01b7d4b1a650fbb9e1c42adb344&amp;filter=3Dnss-native&amp;type=3Dr=
ecipe</a> for example is all nss-native fails in that build.<br></div><div>=
<br></div><div>Ross</div></div>

--001a114034026e5f0f0527907601--
