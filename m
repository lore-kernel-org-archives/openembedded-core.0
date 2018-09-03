Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2CABC78A0F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 02:50:58 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id t71-v6so616466ybi.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AVbOcXNg1C6yycdCRzbFhu68fgTWOWPCd9K4DCLH67Y=;
	b=G8IpghVBfzINAPpZNWqAgn9rMNUJyQU+Xm4F4nvp0/TulVBG18B/QUQMJ/dmMJahlf
	MI2U+hQ5hCghnwAG6Lyqr2j720Sz/fGcGof9xLjQfiqCAtprTmtZHEeibbWPg7s8UhqH
	dJ/VOKcWoik07vG38L/llJdIx+hkYkN2uUoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AVbOcXNg1C6yycdCRzbFhu68fgTWOWPCd9K4DCLH67Y=;
	b=oq4i4hqOkVhKVM29WaX58Fd8SpRTHHMhO0NF89rjEotrDNxq8b7nNUXXvySDbMHISW
	gKhXwd8tPrDqqlhzFF3wBSyavIEB6SXLv1wjw1n0eB6kKDkLS9KdXmJ2Ka/pQ/f+/GNm
	to3/trOIohupbIFGDsKbkYFnNm9vPWtKRptkZKAGQbo3Crr3rjQuX2wYNhW3SB4GKPJr
	Lo6c9J20yeGhKkg9VrwuPV5P4/7/8P90j1+ah9xDmMcUAE63dGX78+jN0ofq0jqiAC96
	I8pWyF8NWn/431sAeomfD7HrSWJ1vLbLbR9rGg2DTY+yv/7DniXCzNjQ4wpLbulfe1Hb
	4+Cg==
X-Gm-Message-State: APzg51BeiGunS9CA6+x2/8cwGTBmXWkLsUXj72Kb+AnSBpIwHTsTJZ8N
	Q6DGTNEe2qYKlXB5d4xRM3oKow==
X-Google-Smtp-Source: ANB0Vdbe0kwFkUAXWZZbPR/gLYfcxwfdbNIy7Lf9fdnxvcxCyghMa44ZxuNC/f9JanrOYmXqipfHrg==
X-Received: by 2002:a25:1345:: with SMTP id
	66-v6mr14424226ybt.171.1535943059939; 
	Sun, 02 Sep 2018 19:50:59 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	b139-v6sm5909137ywe.108.2018.09.02.19.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Sep 2018 19:50:58 -0700 (PDT)
Date: Sun, 2 Sep 2018 22:50:56 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180903025056.GE26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
	<20180831135324.GO26633@bill-the-cat>
	<e7261e4b-1d4b-afaf-7078-3884021878d3@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e7261e4b-1d4b-afaf-7078-3884021878d3@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Mon, 03 Sep 2018 02:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 03, 2018 at 09:58:01AM +0800, Lu.Jiang wrote:

> This patch simply move code from script/lib/wic into
> meta/recipes-support/wic/files. I didn't touch code in this patch.
> 
> Please see attachment for patch formatted with -M.

Exactly, formatted with -M it's clear and a short patch.  A follow-up
question now, are there any comment paths, etc, that should be changed
as part of the move?

-- 
Tom

