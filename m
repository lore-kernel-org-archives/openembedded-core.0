Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B77E560557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 03:36:01 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so20172058pdb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 19:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=2NKbafGJOk6J8VTJY1gdhYoiZ5cYnNZ8cnmG/8nVDVE=;
	b=LgUiJsblcRIWu3IW6HdINMJ788A+QTG805ByTqLz7RPdaoU9AB4UOqz6jcdzPkdV8H
	+Nu9q8dZKvN+nTkLmTuS6f8IpOX60icrUF9tG7kU9REVfbHTXICoHZWPOK6Q2VnGm/Kw
	CIVRGx/CTgJgVBQYdo6r8bs5N9zS71W7Kx70kHTCO4qVpkJt509WnRHqKGNcGrJqYzcs
	/Qr44o6T4k8HaD80l7WxfTFRb5kGaw9JvxRH+6LuX3RUVqVuwE0qYlgyRRUe4fxRWNIX
	giCXZnef+Cn+wUyGFfilRgqsKEmd8VDwZplH73qugzsE1affgcZJFJAZXAMCAxMTwloX
	vpBg==
X-Received: by 10.70.130.229 with SMTP id oh5mr105338061pdb.39.1419996961965; 
	Tue, 30 Dec 2014 19:36:01 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:2d4d:333b:6f45:68dd?
	([2601:c:a700:272f:2d4d:333b:6f45:68dd])
	by mx.google.com with ESMTPSA id
	ws4sm39654262pbc.53.2014.12.30.19.35.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 19:36:00 -0800 (PST)
Message-ID: <54A36F1D.7090901@gmail.com>
Date: Tue, 30 Dec 2014 19:35:57 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
	<54A2EC21.6070308@mvista.com>
	<1895049.K8DhQhocfW@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1895049.K8DhQhocfW@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH 0/2] Backport fixes for git-perltools split
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
X-List-Received-Date: Wed, 31 Dec 2014 03:36:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paul,


On 12/30/2014 12:39 PM, Paul Eggleton wrote:
> Hi Armin,
>
> On Tuesday 30 December 2014 10:17:05 akuster wrote:
>> On 12/30/2014 09:02 AM, Paul Eggleton wrote:
>>> The following changes since commit
> 1cf1edcd28a002291622d04dd2d0ee2c67e329e4:
>>>     buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)
>>>
>>> are available in the git repository at:
>>>     git://git.openembedded.org/openembedded-core-contrib
>>>     paule/dizzy-git-tools
>>>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
>>>     paule/dizzy-git-tools>
>>> Jackie Huang (1):
>>>     packagegroup-self-hosted: add git-perltools
>>
>> This change is in that gray area "does this really need to be back
>> ported decision make processed", so I did not include it.
>
> I would argue this is of a similar order as the other fix. The tools that the
> git-perltools package contains were in the build appliance already until git-
> perltools was split out, so it's fixing a regression (though I think that
> regression happened in the 1.6 timeframe rather than 1.7 FWIW).

Thanks for the clarification.

  This should be included then.

Regards,
- -armin
>
> Cheers,
> Paul
>

