Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 49552797AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 11:56:37 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id m62-v6so5284877ywd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tzWdBcuBSU40s9JHF8LhDKXRAMSLcyMEvgacMUdwcPA=;
	b=PGOYuULS+Rj/jBE0uFX/NSyagKPWxnSPngka69Rc1LX4csiEEpm6Qb/n0IP1WRxSCf
	ALMnG56kDA4zd9Ck9Q2zVo/Dphkd2Ig74n/vUZ0nKQWHhksq2zIt+ma7AOI1iDrpG2rU
	pziapP3jGQ3gzNF527XqLHqgfVtj7lqz53d64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tzWdBcuBSU40s9JHF8LhDKXRAMSLcyMEvgacMUdwcPA=;
	b=dAtr7Ha4JufFInGkF/aaE6ZvAIztee3Tt6B+tQbU++iAkAQcfN/yRomP1E4Od7e9iT
	g99jlhV/r/xK8/asRJCGYbYdYDSgTif6i3yHk1Q3/2yVxzBVLrQEvdJJI7WGGqvqnY12
	p0XnjT8FnIMjGywQx96eEM7IwT1nyPbAWPbnFWi6uqQmT1PAav9fFCfkBciaHMdQag5+
	HrsorKgFSqMLn3yvWk7nk5DqYGc/lfMTMKHGLm2+yS7HOXl0n9cyg2IcGUG3NVpw/rfV
	kenGqZcYrrbvHLr4rEeVioB9you9067IxlabfAlxvmNz6elZKygpqVJeOWtC/gygLyeb
	s0sg==
X-Gm-Message-State: APzg51Dru9qRIEORj5sCoGiRtftXEkA4G38OYlO4Ct9gVOvoVO1SHlWN
	zJTGIYZwPXCQ84S6G/OB8ExqgHHFFI8=
X-Google-Smtp-Source: ANB0VdYvfcGLw2ny8xOlx4qeyZ4FSvfIBoHG219VKZstMofzuD+8+QJEUMob6sd3fDosO7t6xdgO9Q==
X-Received: by 2002:a0d:e3c3:: with SMTP id
	m186-v6mr3778518ywe.317.1536321397936; 
	Fri, 07 Sep 2018 04:56:37 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	r69-v6sm2702460ywh.44.2018.09.07.04.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 04:56:36 -0700 (PDT)
Date: Fri, 7 Sep 2018 07:56:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20180907115632.GH26633@bill-the-cat>
References: <1536291131-24332-1-git-send-email-lu.jiang@windriver.com>
	<1536291131-24332-2-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1536291131-24332-2-git-send-email-lu.jiang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic:mkefidisk:add use-uuid for all partitions
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
X-List-Received-Date: Fri, 07 Sep 2018 11:56:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 07, 2018 at 11:32:11AM +0800, Jiang Lu wrote:

> Add use-uuid for all partitions on mkefidisk.wks.
> 
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

