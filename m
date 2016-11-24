Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 4B42B7198A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:09:07 +0000 (UTC)
Received: (qmail 12278 invoked by uid 1003); 24 Nov 2016 14:09:08 -0000
Received: from unknown (HELO ?192.168.1.59?) (philip@opensdr.com@174.63.39.132)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Nov 2016 14:09:08 -0000
To: Patrick Ohly <patrick.ohly@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
	<1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <d0a381df-850b-6a63-7f7e-47741618cf87@balister.org>
Date: Thu, 24 Nov 2016 09:09:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479973589.6873.15.camel@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 14:09:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/24/2016 02:46 AM, Patrick Ohly wrote:
> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
>> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky, and
>> there is no passwd, so that user can login easily without a passwd, I think
>> that current status is more unsafe ?
> 
> Both well-known password and no password are unsafe. User "root" with
> password "root" is not even "more" safe already now, because tools that
> brute-force logins try that. Choosing something else would be a bit
> safer for a short while until the tools add it to their dictionary.
> 
> Poky is also targeting a different audience than OE-core. Poky can
> assume to be used in a secure environment, OE-core can't (because it
> might be used for all kinds of devices).
> 

That is the first time I've heard Poky is targeting an audience assumed
to be running in a secure environment. Should we document what Poky this
somewhere? From where I sit, this seems to be an odd limitation.

Philip

