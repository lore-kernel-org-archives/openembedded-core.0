Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4971A7F331
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 18:06:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b6so7188777wrv.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 11:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JCfPxgyeymz1Byc1bi9wVEUXKtZGIdksqQKgmdEjN2k=;
	b=hBci0PfcsjiOBnwO6+8f0kF6JN2DpFYBOHaeSKYYE1IxnrXgzuK027dvt7rL6KGkr6
	6fyUzQP35dYjQb457zt69bHsqNf0M42sa5FiEsD4ty6aRZCccsvNkp/+AAYWpJkFELoq
	fSTjkzqLnbnT3J/DED6sTXAFkFlZQiRMaf23UXuFhJo6sv421XZh5DChA2z9pAy1RQ9K
	szZMRPmzshmxse/QZXHBiahf0lBBCk2llR4Q4UXAdYIwfz9K9h+do+98ivNANjqRIWFk
	nXZMCovjV2fJoqSdyJ03ZOSC/fUUDw/Rqy71G86OY4OCHPmbT5ZqDPM0MB1EQeMGDtZw
	+SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JCfPxgyeymz1Byc1bi9wVEUXKtZGIdksqQKgmdEjN2k=;
	b=kvRrwA/KzUqPdQSnrRT1Ifxeguq3o3wlVu+IDACS8DWoq4649AEx9LfvMGniqvz8Gw
	/5FHRV5weazecXF1a2yderh3Oxr/ivZGtV/Pa/Wv5GPs8B89J5eima08XSe3DT+/JNpV
	AsIrZkKFgXOX2NiMbxVodYCcEs5mZCL0VSURHOETeJCUU9Z26oynN9/odKJd74rWTqMP
	MvWk5DuH7/XgImfQfp1uvNXKYkNXtiUL2VLLYcMUo8Sf7oDYKe2/RBOgkklZ/HqShPfV
	Uy5Ju9fz+YB5Bir5VgHgnI2D5XwoZ3r5uH+1ndtqfxnnoqwaNIJx4mX/Ho9CF23mrjZE
	so4A==
X-Gm-Message-State: APjAAAV2/S40o9A58i/ylVGZ30e2Ch3xpY/7ZttrT52kDJ44Jh36/ZLk
	33OMzR9mf63ZGnqJPW9cZTVSz6TAC62x7vR1Q3s=
X-Google-Smtp-Source: APXvYqzTMb8VMlRDli5+0+thwpSclFkUcuRgVC6VqmLj6JPGllJZxAJYJANAFVx1zEP4LlZEhM7TxlxSqLvQIc+/9Fg=
X-Received: by 2002:adf:f482:: with SMTP id l2mr6258935wro.103.1567274820111; 
	Sat, 31 Aug 2019 11:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
	<20190831121850.GA4729@localhost>
In-Reply-To: <20190831121850.GA4729@localhost>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sat, 31 Aug 2019 20:06:49 +0200
Message-ID: <CAHtQpK4c_g=+Z1tr2TTdM82vUrhQ1MRE6iThVK3qBBFgQBr_Lw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 18:07:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 31, 2019 at 2:18 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> Disallowing appends could cause huge problems for a user or layer that
> has to append local options (e.g. proxy) building a recipe like libedit
> that has to change the User-Agent.

My point exactly! I belive that even though this is currently the only
recipe to have this append, this might not be the last one. And in
this case, that prospective recipe would require user to setup his
local build system with additional .netrc file, just to have it built.

>
> cu
> Adrian
>

-- 
Regards,
Andrey.

