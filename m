Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ua18e-0004CD-1H
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 11:58:21 +0200
Received: by mail-pb0-f53.google.com with SMTP id un1so1084540pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=1i3zvg8P1kTFyq1R5IP4KYJ3bhBmWghjrTf1SpC42GY=;
	b=zdaCq79nXmuc5PO0J38PUpR8nlV39pnNDX3VjKL7I9lmRDh41opEJngDccmzCIfs80
	zy5Ek4WmCFt2aDZp75jJF3AukizU6EYhoPL+bb9eRM6ettvn6z92ZFxHgE4moFYDCzC3
	UztF6/7slnTN1DBXh+Q+ug0lkrXpWHdpyvshzSjZ/cipZhSl72W287PGXxzyKiJ/sYGV
	IG8tubm0Fz5nYFhfCeywvpekyd4/f3xvVPqKcckHHZoJNwpqR/SBRkbKOxDNAlfQHqiU
	IIp+1+38/yx8HLZ+bz8SRWQQyXGzPg4VLpPifsrNf4gu9pjNWoVS2O/WpqGN2mrjI7x/
	+xJg==
X-Received: by 10.68.13.35 with SMTP id e3mr6621656pbc.30.1368006017248;
	Wed, 08 May 2013 02:40:17 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	fa5sm31911991pbb.35.2013.05.08.02.40.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 02:40:16 -0700 (PDT)
Message-ID: <518A1C61.9040602@gmail.com>
Date: Wed, 08 May 2013 19:35:29 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1367995796.git.sgw@linux.intel.com>
In-Reply-To: <cover.1367995796.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/23] Updated Pull
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
X-List-Received-Date: Wed, 08 May 2013 09:58:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/05/2013 4:52 PM, Saul Wold wrote:
> Richard,
>
> This is an updated version of the C-Pull, it address the udev, binutils
> and final gcc-4.8 patches.
>
> I will propose a 4.8 patch to update to that version later this week.
>
> I have another batch of change, but I screwed up the push to MUT before
> building it. Expect that set tommorrow evening after the weekly build.
>
> Sau!
Was there a reason why the "boot-directdisk: Scope HDDDIR and HDDIMG 
variables to avoid conflicts" change was dropped?

Regards,
Jonathan


