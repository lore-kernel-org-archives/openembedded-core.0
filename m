Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1UN3si-0005hn-Q5
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 18:16:20 +0200
Received: by mail-pb0-f54.google.com with SMTP id xa7so317526pbc.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 08:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Y3XpQuU5b2tj60dmSfiP1x/xXWaDlRahHy2zqRWLhm4=;
	b=i8B25GmAFJulaKPxRYWqmFWhcicErJMU4YQ/8csrhHQa0T072j6ubN4wkTrxtXvt34
	DerTQ0O9L00aUTzbzDdEVdE5lXQdF2CBDnjqFkyFRcVao/ChSwkQPQGLZ6dPS5cy96/t
	D4JsZqYErZmIs40RREGlt28Uwpz0X+w2mhk79YqCQikmhpX7McYms/MUOATuJ2uVPFxf
	uTfqm1VQh3qE7q3c+QItimGYSK9Z0ogneLETuvK28Nk4H52PcaeN7DIk79fHu3OlWF0Q
	BdYZUs5OxGwL0cqrxqR9xlc9rurG2GpqoqgfojgosP/VlcnUMHmBTJgPQwo0aN2Unr8+
	SrJw==
X-Received: by 10.68.224.169 with SMTP id rd9mr24852516pbc.199.1364918349857; 
	Tue, 02 Apr 2013 08:59:09 -0700 (PDT)
Received: from [10.6.18.24] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id hw16sm2853241pab.19.2013.04.02.08.59.08
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 08:59:09 -0700 (PDT)
Message-ID: <515B004C.8060202@intel.com>
Date: Tue, 02 Apr 2013 08:59:08 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
	<CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
	<CAHUNapSwkvRWD13RK_x2cu-1Q9CdYSKhw9OQFcek7vYjR0UFfA@mail.gmail.com>
In-Reply-To: <CAHUNapSwkvRWD13RK_x2cu-1Q9CdYSKhw9OQFcek7vYjR0UFfA@mail.gmail.com>
X-Gm-Message-State: ALoCoQlTAcd8CjowMWw/jAgIlLg1zVo8m5omvX9Ntg5XwnszkwyGkxA1svNweTfHWdh6SwnmeM8P
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
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
X-List-Received-Date: Tue, 02 Apr 2013 16:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2013 06:18 AM, Trevor Woerner wrote:
> I'm seeing this exact same error when I perform a "bitbake world", and
> have been for the last couple days
>
I believe this is a real problem, and I suggested to Nobuhiro that using 
PACKAGECONFIG with gtk+ would be a better solution, but have not see a 
follow-up patch for this.

Patches welcome!

Sau!



> On Wed, Mar 13, 2013 at 9:43 PM, Nobuhiro Iwamatsu
> <nobuhiro.iwamatsu.yj@renesas.com> wrote:
>> ----
>> checking for i586-oe-linux-pkg-config... no
>> checking for pkg-config...
>> /home/iwamatsu/yocto/alsa/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
>> configure: WARNING: using cross tools not prefixed with host triplet
>> checking pkg-config is at least version 0.9.0... yes
>> checking for ENVY24CONTROL... no
>> configure: error: Package requirements (gtk+-2.0 alsa >= 0.9.0) were not met:
>>
>> No package 'gtk+-2.0' found
>>
>> Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> installed software in a non-standard prefix.
>>
>> Alternatively, you may set the environment variables ENVY24CONTROL_CFLAGS
>> and ENVY24CONTROL_LIBS to avoid the need to call pkg-config.
>> See the pkg-config man page for more details.
>> make: *** [all] Error 1
>
> Is the proposed patch from this email suitable for merging to master?
> It allows my build of alsa-tools to complete without error.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



