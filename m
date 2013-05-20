Received: from mail-pd0-f171.google.com ([209.85.192.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeMg1-0000dk-Aa
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 11:46:48 +0200
Received: by mail-pd0-f171.google.com with SMTP id t12so3497507pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BDudT8KaE1AjXkZQrM+sFuArjvlPnfbCNDsD3UMmdSo=;
	b=tPzeGXLimrPC3s90T/hRFR2zVMh/8M4HocD008P6EQq8ts3Qf1k2jfC3wqFxuwNVCv
	F+x26DBD466PtaeyeJ5mHHQQ7Dr9xHjj8LlXxm82mwqmMRpBf3MIW028h359H8O2OrTr
	h571i0GnOC+SWpakEo1cHCzfAqrgqh7ruoemZ8JsWNUvHaa2Ww/xjzyRUj0Sz5VYpgg0
	h08MXl31UqcBbE0ptlNltpgI2lLU1tZ49la4FGXD2m34ShgFLohP66ZiHpKXuMhmae/g
	TO/FXtyGEXJ1Xm7tR+NmadwfNjgGacL2doEoGnn1mxU4TiC0kVL/voaPA57BsOYJB+8r
	vGdQ==
X-Received: by 10.66.253.74 with SMTP id zy10mr59781552pac.123.1369042104256; 
	Mon, 20 May 2013 02:28:24 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qi1sm25022164pac.21.2013.05.20.02.28.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 02:28:23 -0700 (PDT)
Message-ID: <5199EB97.50900@gmail.com>
Date: Mon, 20 May 2013 19:23:35 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1369013370-21391-1-git-send-email-net147@gmail.com>
	<1369041556.6920.182.camel@phil-desktop.brightsign>
In-Reply-To: <1369041556.6920.182.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate-volatile.sh: normalize repeated leading slashes in TNAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 09:46:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2013 7:19 PM, Phil Blundell wrote:
> On Mon, 2013-05-20 at 11:29 +1000, Jonathan Liu wrote:
>> -		TNAME=${ROOT_DIR}/${TNAME}
>> +		TNAME=`echo ${ROOT_DIR}/${TNAME} | sed -e 's@^//*@/@'`
> Why is this a good thing?  Your commit message is rather terse.
>
> p.
It reduces the size of /etc/volatile.cache.
Otherwise for example if you have ROOT_DIR=/, TNAME=/var/log, TNAME 
becomes ///var/log.
Also if you have verbose mode enabled it actually prints out the extra 
unnecessary leading slashes.

Regards,
Jonathan


