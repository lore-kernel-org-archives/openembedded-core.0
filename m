Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9B997317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 18:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u19I46ER016285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Feb 2016 10:04:06 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 10:04:06 -0800
To: Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56BA2A15.2060706@windriver.com>
Date: Tue, 9 Feb 2016 12:04:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 18:04:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/9/16 11:54 AM, Khem Raj wrote:
> 
>> On Feb 9, 2016, at 1:39 AM, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>
>> On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen
>> <jussi.kukkonen@intel.com> wrote:
>>> Default to libcrypto (openssl) as before.
>>>
>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>> Looks good to me. this is the same implementation I used in the mesa
>> patch.. so we need to make sure that any review feedback is applied to
>> both before merging the too,
> 
> since its spans multiple recipes would it be better to control it with
> a global knob instead of packageconfig.

I'm not sure it makes sense in -this- case..  but I've more then once thought
that it would be nice for a global distro "this is the preferred crypto engine"
setting.

That way you could do things like default to openssl, libgcrypt, libnss, etc..
whatever is appropriate for the system you are building.  It wouldn't promise
that everything would just use that crypto backend, but things that could -- should.

(This is certainly a more extensive patch then what's being discussed here..)

--Mark

>> should we get any review feedback.. but
>> in any case:
>>
>> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


