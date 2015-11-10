Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7335F74197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 12:52:21 +0000 (UTC)
Received: by qkas77 with SMTP id s77so81105097qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 04:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=prpDvkRLNLmGF8kuJ5r/ZItRmbre5DMlMsum8zWCUmM=;
	b=WRmymBMdbrMHVQJIbzxPtXgPQBFjvr6DSkmqEoUunNUFr+bn5Qpl9wh9HKJIjQXXR3
	KylFNu7XoVMhc+reTTR0Sksa9Qc8fvClAQE6DnzCGmI1VkQxcyxilEKkSeVSBX0bFowl
	ngcz2ojK6MpCjs11hEkMjqmShfOd/ETO45T8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=prpDvkRLNLmGF8kuJ5r/ZItRmbre5DMlMsum8zWCUmM=;
	b=nMSIDY9NDxqiODKkZ+4TrezrY18gAii9+BJfZPPk5XIO77Wf6c9Zd14issAOQ1/uIJ
	rMDgqVdHA1GzPmRXJNmGMWJRW6M0mAPbp+b244oFLM4FhMdpbWPu+j1JomMKdXEoGqwI
	2rsBU0wyOvOOjg9OI7IDMPUhFk/t3cuzjTHISHVGiarNe68oTF+GhAm5+cunaC6LujOE
	xCtyYh6P2tkYKjNh5LHpf5+qwj+MkpaT/xEA988lQGudzV+ZWWX7eSosc6tx6vuWONVD
	L285kqtUCvg+dEK/8aNIMNOypIn3A6CZitJILVukKiR5nVToZDA4iMVZLTykMw4pBeLu
	fNQg==
X-Gm-Message-State: ALoCoQlkctmlizca8dGYydAFdm3mym1nHjKavRjqexBgpGJmXwNamhv8NnHsaBYPJ2k5qZMGI0ew
X-Received: by 10.55.74.7 with SMTP id x7mr3877505qka.71.1447159942016;
	Tue, 10 Nov 2015 04:52:22 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	h49sm1216551qgh.41.2015.11.10.04.52.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 04:52:21 -0800 (PST)
Date: Tue, 10 Nov 2015 07:53:03 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20151110125303.GS8499@bill-the-cat>
References: <1447153302-2408-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1447153302-2408-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Tue, 10 Nov 2015 12:52:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2015 at 09:01:42AM -0200, Otavio Salvador wrote:


> The U-Boot 2015.10 has been released at October 20th 2015. This also
> removes the GCC workaround, for the inline behavior, as this version
> properlu supports the GCC 5.2 as compiler.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

