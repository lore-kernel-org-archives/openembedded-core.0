Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIkz9-0007ua-9N
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 20:12:39 +0200
Received: by lagw12 with SMTP id w12so2472254lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 11:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=kBiCXfCRxBV/Zc+uDfuSScL6yFw9ShhTTvvtQW/RwRg=;
	b=uaFUDrZ34xL/ym7/W0BYg9VnYAZ7rPkhACkkdTkd3Rfx5lO4eArXK0t69fXZ1sn87r
	FSewS3Oeen3S7Bix1GGUB+seU6Mk3TS2u/GsTcQbT65lR0hRLEwGcmRsNS09hXQ5M7oH
	wKpI7b7qMhDLG56mXc7JTLwPDHoCgmPBfZPwVdTICkZ1FWcrLNAsS5s4TV1X1iJ9tGmj
	x+HFI4ziRjKs1wP6poG3WbRF8ZHPIVmiPWO2lOBVF9M6I8CFXbMP3+HS8FNPVX/1JbIh
	OEaF4ZgH0P96tNWsn3Mxvd7Gl1i6kot9c/WpXiCtxCdAXC9bFjsakQj9iwlzrESCoUE/
	G+oQ==
Received: by 10.112.83.105 with SMTP id p9mr1168695lby.43.1334340197686; Fri,
	13 Apr 2012 11:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 11:02:47 -0700 (PDT)
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043A0F7@szxeml534-mbs.china.huawei.com>
References: <36ED13F3654AE54CA763E6821D93A5711043A0F7@szxeml534-mbs.china.huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 11:02:47 -0700
Message-ID: <CAMKF1spL3wCCAmTY-uiCrazaJ0xNp7zgEzjh0N9fXGALOyp_7A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] perl: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 18:12:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 4:46 AM, Venkata ramana gollamudi
<ramana.gollamudi@huawei.com> wrote:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # D2194:Fixing the iss=
ue "patch file link is replaced with modified file"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore if file is a =
link, as actual file will also get caught during grep

That comment should be corrected to avoid your internal bug tracking inform=
ation


