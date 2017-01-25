Return-Path: <freesilicon@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7498360750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:58:42 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v186so19640335lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iKwNASiMeegRJZzEHPKMvUZDO5a3cnjZ9anDC49Sgxc=;
	b=EJS/r3T1oql6xF/v0idMqdvTKscP2hSJefaqucCYRs5M+xvCwC4YRbb5RrNGdldm8P
	rBF7GaYJrtcExfdWBblgpkf4tS1vMAr4wiCszm4db36sqtEcZ7kjgmEkte9/KkW8lPzx
	uMtEVEVJPL/bTkHExquS7rL0OH4B122SLgP3tnTScb9PfA1DcygB1gD9QkoKU4XH6L4I
	c4LQe73A6JhoZjLvCUNLKfpDi+ZREgC1sY8Z8BIgUmTzxqLgDzyKZA0hK0XhCWgabW2N
	puTo1BUMaO3RNbCyFTLML02/rNHwEhxQoZPMoAJZzgi0wO2Rz5BY+aHmATDG328bURUv
	94dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iKwNASiMeegRJZzEHPKMvUZDO5a3cnjZ9anDC49Sgxc=;
	b=qpxAb9z/Y1XNCPQxRjitCJG60wWjrHwVf9sQj1fVOeJh6SJMuQ/LXIntzyh3tL63iy
	jRHzAE3MJYvZ479urm8rgmMzODdEXnZY1D83zegX06+p98IdkRfBgqzXnWjTzKslL6Z7
	IkB/lqNuQtDuJltRG7mzxlBzc4xxi5TDN26S49hDxPcKPuzwAzmZksry/V9Q+lpIT+wh
	9z15RfUCVG9KkBcjQyq3mV5LCSbL8Rli3h49CUn9yQscXLXOO79QnHx4lJDB681R0YwE
	h3z66Ghdg8XtWevNJLBNqdP3GIMRWLIRVRj8m8TFt3G3sijxWh92WP6e8k680iBSqbfW
	Cn2A==
X-Gm-Message-State: AIkVDXLC8l/FJQtFhyhZvtbPz9nZmsi4cahj09Voooh7rgJKUXIzFZK2CguqATn8Ln962g==
X-Received: by 10.223.153.15 with SMTP id x15mr32079777wrb.179.1485331122115; 
	Tue, 24 Jan 2017 23:58:42 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	186sm29961487wmw.24.2017.01.24.23.58.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 23:58:41 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 08:58:38 +0100
Message-ID: <9648934.YbsFiyrbuu@crde-port-20.cahors.local>
In-Reply-To: <8ea809ad-d2bd-e575-3447-51cadcb338c2@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124090715.11646-1-freesilicon@gmail.com>
	<8ea809ad-d2bd-e575-3447-51cadcb338c2@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] openssh: Make sshd-config a package
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
X-List-Received-Date: Wed, 25 Jan 2017 07:58:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On mardi 24 janvier 2017 11:07:18 CET Khem Raj wrote:
> How does this work with dropbear. Since we can use dropbear as a ssh
> server alternative.
Dropbear support has not been modified. SSHD_CONFIG has only been added to 
FEATURE_PACKAGES_ssh-server-openssh variable and only applies to OpenSSH (I 
think dropbear has no config file so I don't see the point of applying this).

On a side note, I see that this serie of patches is still marked as 'failure' 
on patchwork, is that a problem or should I resubmit it as new (I may have 
made some mistakes resubmitting it without marking it v2)

David

