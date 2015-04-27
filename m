Return-Path: <scerveau@connected-labs.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B211B73D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:46:43 +0000 (UTC)
Received: by wgen6 with SMTP id n6so120530945wge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=tIOHept9zPLVFgwrt5jIHhT640p40Bl0PmDQbinXiSA=;
	b=HFjJc8wA2pDAOGFYHAKs957wqrX9lY+BmRwWp08iTYpYV7hwcfP3QW6it3F6u4x39L
	MwF9eBz5djq+M3cO8PECSXJAWodm70aHGUnqOdIbl0RJ7jpsQYPEjI0VrF9UkI5E6Gcc
	1UVwJYzeIU3tDieZ7ylBFvntrgTXgUvik+he7yGpzTIH3hBE3rHLKnSBNozkM+GmISZ0
	fyB223c2TDco30xsl8JXZEK3vrvnRX0DIBzA6lg8xqfPCa7uhmN61OKkpjdwzhqcrIgI
	AWQEAMWpfmUweUBfYgCvPyA3XESf2oob6WcsAednn2capSzk77l/mrmMa072GFo8Kz9d
	1hog==
X-Gm-Message-State: ALoCoQlbwTO9F9qYIzBpE5MZZKGWSOQrCeowh//C7WO+8nC4iTmCwhxOw9QRWobhF0NliLpgl7/q
X-Received: by 10.180.93.193 with SMTP id cw1mr22250990wib.12.1430149604188;
	Mon, 27 Apr 2015 08:46:44 -0700 (PDT)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id fo7sm12182437wic.1.2015.04.27.08.46.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 08:46:43 -0700 (PDT)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
Message-ID: <553E59DB.8030204@voxtok.com>
Date: Mon, 27 Apr 2015 17:46:35 +0200
From: scerveau <scerveau@voxtok.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <553E58AC.40002@voxtok.com>
In-Reply-To: <553E58AC.40002@voxtok.com>
Subject: Re: Mariadb 5.5.39 can not be downloaded anymore.
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
X-List-Received-Date: Mon, 27 Apr 2015 15:46:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

It looks that 5.5.39 has been removed.

http://mirror.stshosting.co.uk/mariadb/mariadb-5.5.42/source is available.

Shall we update or put the package on another mirror ?

BR.

Stéphane

On 04/27/2015 05:41 PM, scerveau wrote:
> This url answers with 404 status:
>
> http://mirror.stshosting.co.uk/mariadb/mariadb-5.5.39/source/mariadb-5.5.39.tar.gz 
>
>
> Shall we update the recipe or wait for the server to be up ?
>

-- 
Stéphane Cerveau
Tech Lead Audio
Voxtok Technologies
04 34 40 82 43
www.voxtok.com


