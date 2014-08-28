Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA4F6AC85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:39:29 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so590875lab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Ese1wNhiCEL56TLI0HgOiJVBp7jdv97+heZwE3kimh8=;
	b=n7YR/+9jNYo0SGidvDlk7elKPWTGtVZfPRPC3uaQIrTx1S0W5rZXnK5lrjHIxQiJLs
	HAmpy7nWhGSql2aWMLW4K+xIuRNcZuLrbRV686wT9EU37GlPyVToXM4ByZrz5lpLHh+M
	IKraUjr+OPu5eARlmtfle2FubwfxbWGnVoZfu8lvgW8yAiowz+zSlqnyd/iyI7wnf360
	j5vCAcBDyK3XMZtyxS9pByWL69yRjNmc1vVk9zhqoWvzM7oPAGtv8xTT2lf5ERv9CUKf
	2borrat07tM/ifMJbkauwSrvoHRmGAAV7faHsqWgDKnMTDrFvw2jo9FziXDiFG7YfPyj
	LRDA==
X-Received: by 10.112.202.69 with SMTP id kg5mr2825684lbc.33.1409218769543;
	Thu, 28 Aug 2014 02:39:29 -0700 (PDT)
Received: from [192.168.50.237] (ip-109-90-30-8.hsi11.unitymediagroup.de.
	[109.90.30.8])
	by mx.google.com with ESMTPSA id t12sm5059126lbp.44.2014.08.28.02.39.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 02:39:28 -0700 (PDT)
Message-ID: <53FEF8CF.6000801@gmail.com>
Date: Thu, 28 Aug 2014 11:39:27 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
	<20140825101437.GP20524@jama>
In-Reply-To: <20140825101437.GP20524@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Thu, 28 Aug 2014 09:39:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 25.08.2014 12:14, schrieb Martin Jansa:
> On Mon, Aug 25, 2014 at 09:56:31AM +0200, Sven Ebenfeld wrote:
>> I need to build hashdeep/md5deep within OE to include it in my images. This recipe enables OE to cross-compile md5deep. I needed to add the patch as do_configure_qa is complaining about cross-compilation errors otherwise. I added a pull request for the issue with the variable expansion to hashdeep as well.
> 
> Please send this to openembedded-devel@lists.openembedded.org
> 
> 

Did I understand this right, that I should send the whole patch to
OE-Devel ML? Or should I've sent anything else?

