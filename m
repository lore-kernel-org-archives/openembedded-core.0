Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53FDF6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:51:46 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so25746078pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=QDiRJ7dEalPZ2ORN4yRWFfcC204fYhi7PbiAbelSqic=;
	b=KCgyGpi5OvOy0NPKTpplcNBTKj5W4n+iDHzXZ8fd2EPUXuggxkZTiCU466YHDttQ1P
	GVLqtPq7J+NDtOaG80QoUcg5lmBWoGGwtxe7dWnUpxfgIOlOujeZ2/EUaMKmDHv7bAoG
	VHk740hOEQVMtTQxDoYJSbfYnmVRcjuJzOcEilW03XNdooyp8nAYDApaylS3iW4eL0NC
	pA9uWwpRMECMox0EbTqEJBx2hHj/tOb6WU+AtG3SLbKIV7MxjDo8+CnApC4BfPfAE08Q
	ukr7MF8AA0UNlrXpeFBSDmmOF9TqIQ+4ZhuDBe6NlTT2rYd+e9c8gkZ6D/HabXGAzvav
	bALQ==
X-Gm-Message-State: ALoCoQnvn1KdhFsEptLFwDj99d8iNZQBix1SCXuJ4y2z6IbsJW0dHODytumFYEMXbfPLnz6qKyWC
X-Received: by 10.68.125.164 with SMTP id mr4mr56448449pbb.27.1425397908005;
	Tue, 03 Mar 2015 07:51:48 -0800 (PST)
Received: from swold-mobl.amr.corp.intel.com
	(c-67-171-230-40.hsd1.or.comcast.net. [67.171.230.40])
	by mx.google.com with ESMTPSA id b15sm1333742pdk.69.2015.03.03.07.51.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 07:51:47 -0800 (PST)
Message-ID: <54F5D892.5010400@intel.com>
Date: Tue, 03 Mar 2015 07:51:46 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Javier Viguera <javier.viguera@digi.com>
References: <1424177294-41586-1-git-send-email-javier.viguera@digi.com>	<54ECB8AB.1090709@digi.com>
	<54F59438.1070304@digi.com>
	<CAP9ODKr3GxPaxtBSPvqQ02DRU8LWP2Ybim7EzJHeFcjPD3NGOA@mail.gmail.com>
In-Reply-To: <CAP9ODKr3GxPaxtBSPvqQ02DRU8LWP2Ybim7EzJHeFcjPD3NGOA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport][dizzy][daisy] utils.bbclass: fix create_cmdline_wrapper
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
X-List-Received-Date: Tue, 03 Mar 2015 15:51:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2015 04:17 AM, Otavio Salvador wrote:
> Hello Javier,
>
> On Tue, Mar 3, 2015 at 8:00 AM, Javier Viguera <javier.viguera@digi.com> wrote:
>> On 24/02/15 18:45, Javier Viguera wrote:
>>>
>>> Hi all,
>>>
>>> I see this patch was merged into master. Thanks for that.
>>>
>>> Could it be backported to Daisy and Dizzy?
>>>
>>> A cherry-pick of the commit in master should apply just fine.
>>
>>
>> Ping.
>>
>> Master commit: 49ab89eb9f83388e99069a4b53bdc4cba22bb6f3
>
> Adding Saul in Cc.
>
Added to my pending branch for Daisy, I am doing a sweep of the list now 
for a 1.6.3 build later this week.

Sau!


