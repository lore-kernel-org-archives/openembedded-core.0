Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 994527631D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:41:47 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so54637771pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ATx8WtYAFZbwJthvYAa5JqPi9GVe3iythI5IUNdVWb0=;
	b=YgdsYhH4fS0VjOzK5ctyzjKDq1DktsVN4TBHlGpjLiW30EeddA613jjdJCHhoMzYCq
	08F9RxBIvd/iMcaRjD2PhOM9f1FBHjR/CyX9dC9Nih7tsUWyh5S6lhJv1blvp20JcWUN
	tb4nk5Y4FtI8p6CTrfZBsLaSuUzm9SO0d1XumGJgeRb9zWbw9QUkocbyWDjNCib4xqas
	BQcwpzskrU43E59qGw88qLvKGwP4NB4HeF884d6fN7ictvJlv68DtNmNk08qOszqVzfA
	vEjWS5W2xxO+kgQ7VSCeJrWX3YbL4Aujdesc86G+bnPTg8uxIn+eiWGJIiauEB2y1J/B
	ttEA==
X-Gm-Message-State: ALoCoQnE8kJ6R/kRui2aRLdQPEM4pe6hc2TuLqdTCOsjiU/gjBLiYCBEnceQrttt571qfi2nqOq/
X-Received: by 10.70.130.34 with SMTP id ob2mr69626370pdb.15.1438015307909;
	Mon, 27 Jul 2015 09:41:47 -0700 (PDT)
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	gk5sm24079375pac.21.2015.07.27.09.41.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:41:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdjr16 with SMTP id r16so55686630pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:41:45 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.119.41 with SMTP id kr9mr70975439pdb.0.1438015305315;
	Mon, 27 Jul 2015 09:41:45 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:41:45 -0700 (PDT)
In-Reply-To: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
Date: Mon, 27 Jul 2015 13:41:45 -0300
Message-ID: <CAP9ODKp5X5bK_3-OuBi9RY=L6VSO7sXjdyes3UUG-pOv48FZOg@mail.gmail.com>
To: wei.tee.ng@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Mon, 27 Jul 2015 16:41:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 2:10 AM,  <wei.tee.ng@intel.com> wrote:
> I would like to add hostapd and iw configuration for enabling
> Marvell 8897 Wifi feature. Hostapd and iw configuration were
> created in the recipes-connectivity layer to enable Marvell 8897
> module function in AP mode and STA mode.

It can be added for master, I think. For Dizzy it makes no sense to
backport this feature.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

