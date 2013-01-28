Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tzn0m-0007gl-6L
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 12:36:38 +0100
Received: by mail-oa0-f41.google.com with SMTP id i10so353693oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YSEMIf+zNDD3YHpMcR3SpeIWIv7hAznzNGVXLOtxdrQ=;
	b=T3UU00bVfqqhSp4CHVdWXs5nNQ1S/A6CBtNgLuMWjskMB29QqTBzqgBzIB1pUeyl+S
	8wqOjNZMjKc+52ZNfogqx7XF85Gb1cT06xUoVdNQbXDFUc3TfUbGI2IfH+fAFcuT9wch
	nb9dHR6U6Yha7qpYnMEXS09qzlx+jLrxiR5VSossedXrnXXUj75HPbeaqARnHHviEGIS
	3vyZw5QYFM/a1vLFBY3tS99wPljwCrhbEJPkrmaiOAMSf48XiduQc2eSn1PiYn7Ey+AR
	KqujR2I1Czuwe+FVMh5pgFZFAZpfTWRnw4ANLj3TKID77DcBy9/Ap8MMnwucdZssIFPg
	Qf4w==
MIME-Version: 1.0
X-Received: by 10.182.115.5 with SMTP id jk5mr11027909obb.7.1359372049514;
	Mon, 28 Jan 2013 03:20:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 28 Jan 2013 03:20:49 -0800 (PST)
In-Reply-To: <CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
Date: Mon, 28 Jan 2013 09:20:49 -0200
X-Google-Sender-Auth: GMGId4VazsjidMt-afuwQqLunRs
Message-ID: <CAP9ODKpg6V9P7P1nNcXV2VqCkv2az1D7dtNXcorCxHDKc5EuYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 11:36:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 28, 2013 at 8:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 January 2013 20:26, Martin Jansa <martin.jansa@gmail.com> wrote:
>> ALTERNATIVE_${PN}-systemd = "systemd-def-target"
>
> Let's not introduce packages controlled on distro features whose sole
> purpose is to contain a single file.  systemd enabled -> units go into
> $PN.
>
> Or, if we accept PN-systemd packages, then I expect to see PN-sysvinit packages.

I expect to see PN-sysvinit so we can void them ;-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


