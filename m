Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6725D74D2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 05:52:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k2-v6so2850859pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b4loKN7HNC8+zg5ciL5hLWzb030arTiznZQRK0AC/Ms=;
	b=PdW3yE7pEgSluF8nV4kkcLkfcKkkB9ScF1ASSceO823JxW5ciOvWh7hgODEctG1dyk
	Sd9bcXG8maLhN5ALEEbBuiRbJV4SV8yO9SB/YSwg1u5xQJkCSzMn4/NbxErwqicJMftM
	ghIyUAXSb88HU+1gl9Dlo8LWEIr4KcQdrKO5QISO8jfV8VeIbS+nxGZH5rIwWP2kzsC7
	UwzJKzXtqVjvT+qKpAKkpFM/8YmK5XN7Sb2nhYD+2RlUkFkcDk+yhqXUO1edC7ncf5AJ
	Z5leTtfUvfp626ydnaiGKAQHu69Lyf1WIm5v1MKaVaYkIec8wFhmcAsM8UspSbApimmD
	kEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=b4loKN7HNC8+zg5ciL5hLWzb030arTiznZQRK0AC/Ms=;
	b=A/hkh6JJObOzdVXyHtyNeFJvtDt9sT1XwsQutrlt+PZhEXoDXXYkjF1Vzd/t0A+Iwr
	KD+Av+6fklFWF/F8a26r07NU0Xik1PWH8Tmr99djj+M371DVXr3mDEB6VuV9F9sYYzbr
	YTlQPi2ZdHqNtbc80d88NO17S9nNuUX1K6SJ+3nLv/Y1R2ruHYF0zuqga7ufTokeu0X0
	OQnzojWGAiZ6Coo7H9gc7LhOnYn2/2Q4NtLDJptVe23FC6Mwb/VRhqo0aDa9lDbOYZO+
	0Xd/QLlC42h5YjfqGmEz9o9eiXNiIlbvtBqiPm9BADPGiUY7uAlcK+FeVltgqLiaFldJ
	nn/Q==
X-Gm-Message-State: ALKqPwc3WHmRMMVeMl8ncSgGCmAf68XtKc+zI3G8OjnBPf1ZDHMIAoj8
	6JbKPQsm8Owo0k4iZRgLxBe2B0UA
X-Google-Smtp-Source: AB8JxZryZ8+XPX0IA76TNyj4HDvQSkiBJSBn3l0VGv3UtD++MxnWc1FyKq0+O3lQp2rwT3gy8mZwPQ==
X-Received: by 2002:a63:618b:: with SMTP id
	v133-v6mr6214191pgb.285.1526622730931; 
	Thu, 17 May 2018 22:52:10 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:14d:1a81:a65f:63a5])
	by smtp.gmail.com with ESMTPSA id
	u8-v6sm9865807pgq.7.2018.05.17.22.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 22:52:10 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<071e32634705a36ce4132ab884b3cf11079b4d37.1526452205.git.raj.khem@gmail.com>
	<CAJTo0Lbcs8uy6hujw7S9GHR6fnEX11wUZh2tz37_2fusw9iNFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9e904024-456f-83f6-5a34-6a133275ddbf@gmail.com>
Date: Thu, 17 May 2018 22:52:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbcs8uy6hujw7S9GHR6fnEX11wUZh2tz37_2fusw9iNFQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] ovmf: Fix build with gcc8
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
X-List-Received-Date: Fri, 18 May 2018 05:52:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/18 3:17 AM, Burton, Ross wrote:
> Even when I pick from the branch instead of the mail, I suspect the
> line endings are messed up and this won't apply.  Can you
> double-check?
> 
> (I *hate* the ovmf recipe for this reason and am very tempted to just
> run dos2unix over the tree after unpack!)

I have updated the patches which hopefully should make quilt happier

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=be616a0b6c3decc06f2acbf27f47ebb58d32aa90

Thanks
-Khem

