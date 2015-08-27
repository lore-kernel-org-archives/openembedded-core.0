Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id C0B9B76D81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:29:44 +0000 (UTC)
Received: by lbbpu9 with SMTP id pu9so11365805lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=OORcR0JFMR5V/wQLE299tCTptYCuTQAKT26WeXfn/zc=;
	b=Sq+7Dmil0/tenwnZ2y/8Z96QXI3KgmNwP2xgf9DTLnvRrp8veNYt8G51cZKVQb9w4A
	EGlPqDQaiQSpV3b0cY0faOVd4fAoxqHrFoV0CrsA5uHkJWj/vdziFb52NNu7OBsk1s7w
	4xtkd7IHZ4KfAAOpsgiT+crqtvJJ345jUw8A48FKPNjKvEhZFCHm18oP12B6jLk8voEJ
	4cKWoQ6ebXDMNR/q6KbqyWg9O5YyIamZ+6qn6+u+1cJqx2PclzZq/OHdkWml3XEaEfsO
	6rzXGXcOFZ/XArRKEv+r4cufd8qtGRau9tkvA3nLifK9X9QUMNi0bTGDyIJJijObwKUm
	Mt5g==
X-Gm-Message-State: ALoCoQmYmcdYXugo2c1Z7YHtfHM7fnuhv8TQ6qOmoTsggMJOWOmcrPKqsZuflFtjeMh4Oy6XK9pR
X-Received: by 10.152.6.133 with SMTP id b5mr2195523laa.33.1440682184150;
	Thu, 27 Aug 2015 06:29:44 -0700 (PDT)
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com.
	[209.85.217.178])
	by smtp.gmail.com with ESMTPSA id qm6sm586379lbb.23.2015.08.27.06.29.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:29:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by lbcbn3 with SMTP id bn3so11331878lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:29:43 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.152.87.84 with SMTP id v20mr2240827laz.57.1440682183214;
	Thu, 27 Aug 2015 06:29:43 -0700 (PDT)
Received: by 10.112.211.132 with HTTP; Thu, 27 Aug 2015 06:29:43 -0700 (PDT)
In-Reply-To: <55DF0F98.8050708@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<8664014de25c7f4d9903bea81eaeddce1e7219df.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<2003255.VjrPsemNp7@peggleto-mobl.ger.corp.intel.com>
	<55DF0F98.8050708@linux.intel.com>
Date: Thu, 27 Aug 2015 10:29:43 -0300
Message-ID: <CAP9ODKo+krDM+4ZsoxnNzjmEcfYNvnNftimjFLwEHXc_inphpA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] devtool: upgrade feature
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
X-List-Received-Date: Thu, 27 Aug 2015 13:29:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 10:24 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> On 08/26/2015 07:04 PM, Paul Eggleton wrote:
>> We already have code for editing recipes like this in recipeutils (and in
>> lib/bb/utils as well) - in fact I see you're using patch_recipe() later
>> on, so
>> why do it by hand here?
>>
>
> can 'oe.recipeutils.patch_recipe' patch variable's flags? I did not try but
> looking at the function definition, seems like it does not.

So add this feature there if you need it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

