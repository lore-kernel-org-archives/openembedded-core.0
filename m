Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79C817E06F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:49:49 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id f25so580123pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2Jo4mWD9Wp0vO4f8GRmevfwuB3iryplqFRRWBaezUEA=;
	b=mFSFdlMq3nDDQHe2wrC0lL5lLJG3uMQl+zqen26PSQurNGrCM7wIsk/k9iVThxX+s3
	H8cLV4vPjbGMk7hpzzKsvxjuvK+8Se+u674pB/RwZ2UqI3iY9OIo9hjOrBnVXztS0Q+p
	qCMg/pYhEzPk1txrnHV2bze9LlC9feUw9euTadxZ81Wt6Cjx517GIUD6pIYA322hDE1W
	4gEVlr3NL0ZlqU6O8kXCAVO0BVF57fF0JhcP1LKJepYo0iUJ3eR9f/YjMyGTezysmqif
	ol9OXs7JLfmshCa6WABLBrZXP76bauVzXFmX24e4p8WMmmr1Jf7sp4JF+hKDcBP/cqmU
	T/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2Jo4mWD9Wp0vO4f8GRmevfwuB3iryplqFRRWBaezUEA=;
	b=UoqJZy060e8/OtnX+1/nr6sL3F1qvZyNt722cKAGOVrEXIutn4iZSWuCNiDG3S8DI1
	CVnV6Uw3ggNlzdWfiFU8sHzJQFCSuyq2/mcBSzX5Y+CYTcxXFTxKDrVHhlshMjwkjPN0
	JFKxEqdik1dXl7OI4TTGqloAvnbBRE61lnhexC12P+gx7kZ1YevZns2W0HLSMQC9Vcdi
	c0Aj9bONK+83FMJ02hs2caYKb+BqIPTee6qPq2AFPC45FEMnm/SNSKT+bgoo6Ga9T1BU
	C4RVs2x+ZExntRHr61pKzItt+D4eynbd8uWEW31q1Boueiun0LjfxTBmAmy/ohu637Rt
	MIgA==
X-Gm-Message-State: APjAAAVBRDB9S+FOSfjE3xovvqsHxs8EH7eCyGjV5JgjxWlGFsqnlOsC
	rrweHqgnz1JX/xjzJyozsU0MKj/94rg=
X-Google-Smtp-Source: APXvYqxtMLHDK/ws2R4FYx554Kl1SzzuRhnchD2820v5NHPIKqru/XRhgdwyDV/ooeEuLDFMrz8mHg==
X-Received: by 2002:a63:6c87:: with SMTP id
	h129mr16706245pgc.427.1558374589783; 
	Mon, 20 May 2019 10:49:49 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	u75sm28866747pfa.138.2019.05.20.10.49.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:49:49 -0700 (PDT)
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <086150b5-5a68-b4ee-1fd2-69b51dcb426c@gmail.com>
Date: Mon, 20 May 2019 10:49:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
Subject: Re: Switching GStreamer recipes from autotools to meson
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
X-List-Received-Date: Mon, 20 May 2019 17:49:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/14/19 1:19 AM, Carlos Rafael Giani wrote:
>  From what I have seen, meson support is stable now.
> 
> Also, in GStreamer, autotools is now considered a legacy build system, 
> and will be removed in future released. From 
> https://gstreamer.freedesktop.org/releases/1.16/ :
> 
>  > The Meson build system build is now feature-complete (*) and it is 
> now the recommended build system on all platforms and also used by 
> Cerbero to build GStreamer on all platforms. The Autotools build is 
> scheduled to be removed in the next cycle. Developers who currently use 
> gst-uninstalled should move to gst-build. The build option naming has 
> been cleaned up and made consistent and there are now feature options to 
> enable/disable plugins and various other features on a case-by-case 
> basis. (*) with the exception of plugin docs which will be handled 
> differently in future
> 
> GStreamer recipe upgrades to 1.16.0 have been sent in as a pull request 
> to meta-gstreamer1.0 . Once these are in, I'm considering to switch the 
> recipes to meson. Are there any potential issues with that? For example, 
> anything special about meson and GObject introspection I should know about?
> 

are you doing the 1.16 upgrade to OE-Core as well ?

