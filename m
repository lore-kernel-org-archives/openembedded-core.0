Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 20CAE6BDDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 15:10:35 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so490026obb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dmOcBK5lou1WLkTzVwDONVUj0IUPGbWsD9bziZJT7LM=;
	b=KeCoanaGkLETllEMvM84cVeSemx9BA0AgsRzQbK71wjxbcri6lTPwAYkxJ8L67os5R
	/OzM7zQB1SLB2OZEQj5BMBaxx0xJAURzRp3GDoZuhJx5cUAIfaPiCHHc8g2+V2NSYHTT
	ecBegr5EOBu3LjrA/Nx5XN19qMCR/CY/Edirid35wDy9PCkoPNZDsvkpfT8cc3/b9Y3s
	d24WN7C2/uGMLKqINft3MPqjS+E5dzB0X13raHoIX18ZoeQctO9PaSHmEINHaArQF7mH
	0by9nH2B8r0TNMEP2YhzQS5OcOOHeVUodRwPYjilcHe075U/jVrdqMpz+C/KD2Uf5PUs
	jPtg==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr2500291obx.89.1378307436123; Wed,
	04 Sep 2013 08:10:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 08:10:36 -0700 (PDT)
In-Reply-To: <8563861.p8X6iV9RD6@atv-pwoegere-l3.atv.mentorg.com>
References: <8563861.p8X6iV9RD6@atv-pwoegere-l3.atv.mentorg.com>
Date: Wed, 4 Sep 2013 12:10:36 -0300
X-Google-Sender-Auth: 4I6N4xldo4ipOLAek27lUfl3Z-o
Message-ID: <CAP9ODKqZZtbthB479VE6Xeso47YUQmtLBbnN=cudDF0YKLe-rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] lttng-ust: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 15:10:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 9:51 AM, Woegerer, Paul <Paul_Woegerer@mentor.com> wrote:

This kind of patch is nicer to send using -M option for format-patch
so it tracks the renaming.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

