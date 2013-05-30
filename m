Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3AABD6098C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:42:07 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id un4so375178pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ULdT8Md2duFrjTiwmb43Q2yEDVk83+/cDpfs+DhlfjE=;
	b=LVREgZfZKFFuliFe+cWYIZK2t1Ufr5paQ/aSYXY+yCDttqPZ58crFG2zPBXaD17f2v
	OFiLh1rsWeNLlwiorChNKPGG4whyK+MFVEUNte9WC1QBmB0Dv6oLSWAou5Vhrf5r21qc
	z0DCgRF4p+F1zZKmhOr+RAWB+S9c+VZ0GaEYT8xpKPDXtBVlBFM89Pvim+S0CJ0ldkdZ
	2PGSLbjoYhY8reC9e/J4KrcKVYHGiapBRjGe5eRF3WeB3UgFonFJaSRQIJA7mR9drkUP
	AOA59L2RKbeQnlyM5Kb6E+w9oAF5SDwUSqkaG5X8hyot60kRs9fmgW3ZrHQzWtNMMlK2
	zwsw==
X-Received: by 10.66.155.102 with SMTP id vv6mr8576362pab.64.1369921328631;
	Thu, 30 May 2013 06:42:08 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm44943082pab.2.2013.05.30.06.42.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:42:07 -0700 (PDT)
Message-ID: <51A7560E.7060202@gmail.com>
Date: Thu, 30 May 2013 23:37:18 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: ml@communistcode.co.uk
References: <51A7470C.403@communistcode.co.uk>
	<51A747D6.6000203@communistcode.co.uk>
In-Reply-To: <51A747D6.6000203@communistcode.co.uk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OpenSSL compile failure - building-docs related
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
X-List-Received-Date: Thu, 30 May 2013 13:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2013 10:36 PM, Jack Mitchell wrote:
> On 30/05/13 13:33, Jack Mitchell wrote:
>> I hit this today after a pull on master, seems to be an issue with perl
>> maybe? Anyone have a clue what it might mean? A -c clean didn't fix up
>> the issue.
>>
>> Attached(1)
>>
>> Cheers,
>> Jack.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> Hmmm, seems a discussion here put it down to a dodgy perl, does this 
> mean that my hosts perl could be trashed?
>
> http://forums.gentoo.org/viewtopic-t-958406.html?sid=008a250955b12c23986955ae9f3dcca0 
>
>
> Cheers,
> Jack.
>
Just submitted a patch for this to the mailing list.

Regards,
Jonathan

