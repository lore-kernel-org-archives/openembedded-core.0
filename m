Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 02C5F784AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 16:01:12 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id t3so38972082pgt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z7Y/juEvBm7okGm1ePh6nMvWV+iBk+7YKYpsvTP79vM=;
	b=AXXXqNF0Kz2lEOgGg9Qk8MsjtRNwI/VzAp3CpstFErUq8t/2m3nRGSydqCc5ELdOVu
	/Ktri9NuTEdZ8dbaUek9zISsiUTQlWd020pOtNI0/QHrkhBUxtaUSsr/8VVIbNapdKD4
	odU7MDZoE0oyD3muvfmtDixAmRIPIYGs5l/MV0b3Nc+ls1gNCYIn9b7OOLMFoDTiVRw1
	HXXeDDizorT2DF25jyr/Rj2B8fvqHtsJzAuxEujtubamHYIlfGieLgGYPaZCrr6mqjYE
	JKrsVbuqLgnHL4ReOR6F4sCGNU9WFlPFTNxYZYSkmg2sC3MN9TCSgpx3oUDtpBGycPr2
	Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z7Y/juEvBm7okGm1ePh6nMvWV+iBk+7YKYpsvTP79vM=;
	b=JW7886sZD/RCHQN1oPpunaFkLcSAcdoyhDLoxBR6Jxh0RMyh50DjPTe4hGw1tWAJvU
	PX3mwD4NtqpRxR5kT2qBFHZoR1VoQYmh5jyGtinDWYrm7bKW7+cA/GmTnXMjgcTjxVOh
	Rf98cIMHBe6jun1ceKP/p2rMpSrwm/zynelaLqMlaRobZZrtUfLuRxQpisV1MdvfnbPY
	qHM8XsoKHVI+EYxx/ybKlgVsz2vTUVYeZ5z6Y00WoWOYrP+4QshALPSWLRfs/hwpzOy2
	AMnwkdLJ47+Pq+Ot/+7DZE2C2SoPR54DJzRzqRWsmiiFZ8P1EBlVmgCyLLe3T09a+8Il
	MNKQ==
X-Gm-Message-State: AHYfb5jnlTruBGpnGseaJU+JJCdGI3tkTsy4kBf5AD2n2er/RZ1MY2g8
	NIB9Bm+7AqfJGZ5de93cKADwwKd+Sg==
X-Received: by 10.84.149.139 with SMTP id m11mr10017161pla.376.1503072074142; 
	Fri, 18 Aug 2017 09:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 18 Aug 2017 09:00:43 -0700 (PDT)
In-Reply-To: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
References: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 09:00:43 -0700
Message-ID: <CAMKF1spnN=F5ox2CDBcNgh9rNP04DzoEAvQGA31-MOKJ2E4ZMg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bussybox: updating to new version
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
X-List-Received-Date: Fri, 18 Aug 2017 16:01:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 18, 2017 at 3:16 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> Hello everyone,
>
> I would like to ask you a question about busybox upgrading.
>
> Is there any reason, why we are still using the version 1.24.1?
> I think that, the latest version 1.27.2 has a lot of fixes and it less
> vulnerable then the current.
>

I dont think its intentional. Feel free to send a patch if you can.

> I have checked a license and it has not been changed.
>
> Thank you for the explanation.
>
> Andrej
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

