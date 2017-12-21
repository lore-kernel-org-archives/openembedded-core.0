Return-Path: <sledz@dresearch-fe.de>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1973078699
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 09:54:28 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id u84so7234013lff.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:followup-to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Iekzc71zgvAntixQm3vIAS9D7Wz0SUp45yohRZjVh8U=;
	b=PyJNkGKvdRyx7CIxsB+AUUwv3nQHqn5UgoL1Fiykud4OglebWjMoYeK8OfU8y2+IeA
	MeQgFN344epmv2TsU/xGen2FKLA7OJkoFM1159z8/08usW5RQFsHfxQO939gsYPZYvHX
	uwq2jAlLb3FaiTor1jiWoWAHrxNH5+JjsUC6Fd7bbgP7rFeV6Sq5+Bblw3Ws8JGTYKEX
	EyYyy8QKxZX+7iJI2paARcLWXZ3CBazS1kwTIOLumEEF+LD/Q+2F2rPe9JOXOy+16KPj
	zdXmKZ/5iYxEYoG7iOFw5cnRKdgahovvWgBOd1+1AKjLvCR81OQRZsN3txXz6oswNP7j
	vaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:followup-to:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Iekzc71zgvAntixQm3vIAS9D7Wz0SUp45yohRZjVh8U=;
	b=nZpkwzOEvZwrJAyxa/5uLi4uQ4jCS2TpKyMJUpF5PuYPhbGUITJQydU/7doGFyQUpm
	Y+iFlFZE/qxbHUAj77gquhzmS2clcytUx129/nF9Cer7yz57/2Fm9ow5C+SMLYcWgEUt
	2wQFOUj+dWR8VCY6UVMg7p82mZL/H+j+mMio5L8xhHbRK4J/nCA074W75V4heQxB6xKE
	1wC0w1ldfjKoCR6348rzdY/kYdk82XiHod1aQ7R30IePhUE8mTVTDHeWAOPciyIPZlX9
	YfNqLk39gOoKk7hPtiDXtFyLZ4I2l1ioeBlHO0LG253n81djlu71aHQLNGdWHDEm8+TV
	stIQ==
X-Gm-Message-State: AKGB3mJK0zcSKoOU9wwVNe1LXpxCFP6/EeZpNsse/lva2DwNMqiO2O1H
	/UfXjR1oWcklvyB7DoxMeeGvsw==
X-Google-Smtp-Source: ACJfBotvtOuJ+xUa9FtJYxeu5xMS/Zx2QNioRuUqwgrrXIvM7qochjgOKMpBVtUzsi22pqr17OATwA==
X-Received: by 10.46.89.129 with SMTP id g1mr6657727ljf.12.1513850069454;
	Thu, 21 Dec 2017 01:54:29 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	g192sm3788688lfg.58.2017.12.21.01.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 01:54:28 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
Followup-To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
Date: Thu, 21 Dec 2017 10:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 09:54:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 21.12.2017 10:08, Burton, Ross wrote:
> On 21 December 2017 at 06:40, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> Anyone tried to cross-compile for MS Windows target with Yocto/OE?
> 
> Yes, see meta-mingw.


A misunderstanding?

I like to build *for* MS Windows, not *at* MS Windows.

Steffen

