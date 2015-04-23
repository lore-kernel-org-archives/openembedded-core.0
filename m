Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C59706AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 18:33:42 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so67500508ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6zpYcwCvr3cIggiFq00+iesSFQcC/Y2hKzTQYlCMLls=;
	b=UvVPoFwHa61P6+8TfAZ+QtbijIJL96YlOAGYKL1Ijqkt1v/0aVUwHrfcrqkp/99PLi
	9tFWzNsDZJ4oG+VCa/OtiyOPUD9M9Pznz66+SUBZziuHotP/NN6K/d7L3DX6ZeoMbBQ/
	xq8GH2ZruX3EEajAsU2Ekh6TmREn+gsDAGdDqpEvt++WrxWEtJyAcHsgN1rKRNFL426L
	FycaLeQ8G0QEeTBMWXSPgwpvUTpb8qVMVcxQq6Tp0/eTFomLXMiWS7HWTmdmVbS5djPh
	VgGG89tbrWLLEkp66X5gud5OlfZEspUjBUu9E2ySQK5udS0inNU02v1FE/j1gOhL+TGW
	X7eA==
MIME-Version: 1.0
X-Received: by 10.107.33.21 with SMTP id h21mr5873196ioh.1.1429814023537; Thu,
	23 Apr 2015 11:33:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Thu, 23 Apr 2015 11:33:43 -0700 (PDT)
In-Reply-To: <55393A64.4050800@pseudoterminal.org>
References: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
	<CAP9ODKoikygfbhSMMHUk9pPHhvbM9vav_ArAZ7gufTm5s0H_SA@mail.gmail.com>
	<55393A64.4050800@pseudoterminal.org>
Date: Thu, 23 Apr 2015 15:33:43 -0300
X-Google-Sender-Auth: xbodfJymLCDr63jFfVImwxH0190
Message-ID: <CAP9ODKpEX75EN5w+OY0nH9odf5Oyaqt_2vPRvtOTT7G=whK4HA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: make sure all counter variables are properly unset
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
X-List-Received-Date: Thu, 23 Apr 2015 18:33:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 23, 2015 at 3:31 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> It is in master, which is nice. But not in fido? Is it too late for fixes
> like these? If so, I'll have to backport this fix into meta-fsl-arm-extra
> for the cubox-i uboot.
> Otherwise, if it is to be reviewed for inclusion into fido, I'm fine with
> that.

Richard, can you cherry-pick this for fido? it is breaking
meta-fsl-arm-extra boards.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

