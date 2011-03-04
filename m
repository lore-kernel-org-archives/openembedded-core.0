Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvYAV-0002FW-GF
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 17:47:55 +0100
Received: by pwj9 with SMTP id 9so378943pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 08:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Gk+f+X3gQNN/4MqHookKXp13LaJW8/B0TC8kuyMhtbQ=;
	b=wgjb5qppAhPu+MYZ+LgwWettiQFwtzZ7UjEkKQl33rSP1uXHo4aBjM8nudeD7zJuQ1
	wUKXmYah4Uo9YW2+28/IYgGJVMGMuYmRym9decQVl4b8i7qd7qkTb64bmw8C9En37t7q
	E3ueWE1kVxZde0nNQLN9C9Uso4y6aF9msPvZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ZhrH77VqPEChu++O79YWssa6sBVtZni32WGou3xvvfZWEnDNrkyFFGIkb6zSxuZQeH
	HKuAndK0vRzxVi0tqWv55B7muyt3zYYsp057Q6cVbq1Mo+g9StLa6ibneUvpTfZfAKtp
	b+JuOm9sGMNLpX4xOpE1Q7w2m2RE+IqH01mgU=
Received: by 10.142.158.5 with SMTP id g5mr654781wfe.127.1299257184107;
	Fri, 04 Mar 2011 08:46:24 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d35sm3179342wfj.21.2011.03.04.08.46.21
	(version=SSLv3 cipher=OTHER); Fri, 04 Mar 2011 08:46:22 -0800 (PST)
Message-ID: <4D71175D.4050307@gmail.com>
Date: Fri, 04 Mar 2011 08:46:21 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
In-Reply-To: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
Subject: Re: Gst-plugin dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 04 Mar 2011 16:47:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/2011 7:58 AM, Koen Kooi wrote:
> Hi,
>
> The current gst-plguin-<foo>  in oe-core is a bit anemic and the ones in OE are really full featured. How do we want to handle this going forward? I'm a big fan of shifting the pain to buildtime so people can install any plugin they want at runtime instead of needing to rebuild it.
> At TI we have cut-down versions of the recipes to save buildtime[1], but it's a pain to maintain those and keep them up to date. It would be nice to come with a way to say you want full featured gstreamer or not. With my angstrom hat on, I would like the full feature set :)
>

May be controlling it with distro features

> regards,
>
> Koen
>
> [1]  As well as dealing with the inabiltiy to build opencv with a specific CSL toolchain
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



