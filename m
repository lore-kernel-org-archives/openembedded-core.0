Return-Path: <diego.rondini@kynetics.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8431B748D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 14:46:19 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id n6-v6so10218747qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Xq5qp2YqN/KNF9oojAHgzKzMfDCH5XzX3COOCU9aRfg=;
	b=GR8nJjhkQ48jjXIRBcRqGk4qtyjwSZBa3sv6ImMdSw8Y9whjaOCuTRr9zdRP9MFcDR
	fDdURcXmcrR2dqKaiSBaoVgTMVmYj5CpRafGEZPAsFQiUPpU+S4bhFQlkKeXwzhLBsos
	SXtAQvG8i8zrr1UWmzEUI/lw42niO1SRZMph8/l23muNG0lhJm+CTuT2ju7whJ2xIzDG
	V1caXpuiZ3PTEcHoJRAObldvwBee9cvJxx5KOvloSLO99Fex2bh9ORe124n7eo19+dDk
	kt6mSWkyoSeKMfHYCOWEmph1NXqt5a6CAwRcobMI+VtXfWEDM+gwrUtwh3BS3sk74STm
	v7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Xq5qp2YqN/KNF9oojAHgzKzMfDCH5XzX3COOCU9aRfg=;
	b=MMR2Uwdk8BjtIXl8wN3+oxSkC2aWObMyus0eb4F/7tJZ/uHk60hAaBgXemPEowFA0A
	6HE4uw0CmORd3o4ryPnVkSlq9TDwvoDCIpm9TJTR/2hHwb1ekshX76bmoSGoiQ8ke/8i
	mdfmbNw7jGBAheowA6NXZvdotqNIJ65a0aqEF+58DbCT3HWXY/2hmSLj8T2Hf5tvNOL3
	YA2U03j22kRKYgqlPNmB5cletYjSw2ei4KFg34ulq+mjcZVIF9qI7Lntcm25s8sqrXig
	EAWIWypYZLGLwZVGtWy2HuA+vIjHr1Qq4XHXrPLYLmctCx6gCVMwTLhXxC9gT9H+4y66
	JUdQ==
X-Gm-Message-State: APzg51CGt/kk/WsaESPppJ2H8CBlJS3c182u4lEHlNy2QAgcP+pgsHPx
	OZwAP0Vdf9Wr5oHCTlmnSb6af65h/1H+vahKtPJXhfU0uVA=
X-Google-Smtp-Source: ANB0VdaVNdtqABcNliI1f6EZko2FyzN3oRbcg3ugc269sVPAhxSlekyRjl5gx0oJgmE64H++jxvQrRfFMDnmYqkVyQk=
X-Received: by 2002:a37:f19:: with SMTP id
	z25-v6mr11635460qkg.147.1535640380310; 
	Thu, 30 Aug 2018 07:46:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:357a:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 07:45:59
	-0700 (PDT)
X-Originating-IP: [79.7.224.57]
In-Reply-To: <1535636519-3244-1-git-send-email-diego.rondini@kynetics.com>
References: <1535636519-3244-1-git-send-email-diego.rondini@kynetics.com>
From: Diego Rondini <diego.rondini@kynetics.com>
Date: Thu, 30 Aug 2018 16:45:59 +0200
Message-ID: <CAMfw5YqyNPPV_WuP6MDoA0fe6Qr0q=xTGDv=SZhBTGheUgj8Mw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][rocko][sumo][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Thu, 30 Aug 2018 14:46:19 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, sent to the wrong mailing list. Please drop.

-- 
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

