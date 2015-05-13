Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1404874056
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 10:59:37 +0000 (UTC)
Received: by wizk4 with SMTP id k4so193102622wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 03:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xs/jI1F+geYvGOdWvTsDTR3T/NqUHC7bk09FleYp940=;
	b=QBbAe51rOnapwC+RsYE91jTvSlUD5VnULoft0yBysvLDEp8xeeTje2aPuVuBx6oKe8
	/BEeuPxX+zcFaqalZMsNOXsHtKbG2vAeilk/l1f4YRS9lI0SPsNeEpIxnIHAc7x4Uede
	FjV3xTnt8iOD8TgekZmVYtdvddc6ZPGnn1vv3lalYhJ5qDMTMeWJIgKyTNWaCPQgs4qP
	QWTHONgP+OAPZ2SfBSasQMnqxoXOifj6H71ArTAgH+FbbhGdAYAqpLitDnajBtMjYCWh
	DXALLFG+cUizm5tF7DjURZa2C0Sgd4tYqUvdO5r787udUHbADRl2iOYxQYcLrMoCbJvl
	Z08Q==
X-Gm-Message-State: ALoCoQmfC6/uJyXKpoMsLlUacqbfqtqDcfYtZ3iaU1bD5HDQnuX97Q6BPbKonmTJedU5Bp7UkTgT
X-Received: by 10.180.94.168 with SMTP id dd8mr15454213wib.76.1431514778450;
	Wed, 13 May 2015 03:59:38 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id cf9sm6727494wjc.27.2015.05.13.03.59.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 03:59:37 -0700 (PDT)
Message-ID: <55532E98.2070404@dresearch-fe.de>
Date: Wed, 13 May 2015 12:59:36 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <554C98F7.5090005@dresearch-fe.de>
	<2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Wed, 13 May 2015 10:59:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 08.05.2015 14:39, Paul Eggleton wrote:
> Hi Steffen,
> 
> On Friday 08 May 2015 13:07:35 Steffen Sledz wrote:
>> Since switching from dizzy to fido we've some warnings related to some of
>> our own closed source packages.
>>
>> WARNING: log_check: There is a warn message in the logfile
>> WARNING: log_check: Matched keyword: [WARNING:]
>> WARNING: log_check: WARNING: The license listed CLOSED was not in the
>> licenses collected for foo
>>
>> The recipes contain lines like this one:
>>
>> LICENSE = "CLOSED"
>>
>> How should we fix the recipe to avoid the warning?
> 
> I think the part of the code that produces this warning probably should be 
> ignoring the CLOSED value. Can I ask you to please file a bug? Feel free to add 
> me on CC.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7752

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

