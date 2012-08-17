Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2Mqc-0006Pt-IR
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:44:22 +0200
Received: from localhost ([127.0.0.1]:49648 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2Mf1-0002Eh-US
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=iHEqfAZH8GYEaIYIJqTwiW1TsOI=; b=l6pgwQdM+zrlVB+qqEutWktQAI73
	NqslVdyRAWkv0MriYARwh6AAUOb+BuGpRKmcuBLEhFftxw0ftn581kZqHxr/uYND
	Zrx0p036jCI+3Kv+o2i01NZWSENAbXx+iaR49L0rnjqSEWnKzBfgts4bSN44zTU6
	cS9CNtGEs2gt4BY=
Received: from [195.171.99.130] (port=31180 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2Mf1-0002Ee-QM
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:32:23 +0000
Message-ID: <502E4839.6070100@communistcode.co.uk>
Date: Fri, 17 Aug 2012 14:33:45 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345209562.27428.5.camel@ted>
In-Reply-To: <1345209562.27428.5.camel@ted>
Subject: Re: utility-tasks: Set T to alternate location during do_clean
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/12 14:19, Richard Purdie wrote:
> +T_task-clean = "${LOG_DIR}/cleanlogs/${PN}"

Cheers Richard, this does the trick!

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



