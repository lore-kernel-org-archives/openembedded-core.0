Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 1441077E68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 06:36:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id 6A3AE264FC5
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170528065940.16603-1-romain.perier@collabora.com>
	<CAP9ODKremvtL4xsZUft8L3hKUZksp94Hpc3nFKgVbKKLe8hjtg@mail.gmail.com>
From: Romain Perier <romain.perier@collabora.com>
Message-ID: <ff1d28df-4dc2-71f0-5b3e-07ab8254c968@collabora.com>
Date: Tue, 30 May 2017 08:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKremvtL4xsZUft8L3hKUZksp94Hpc3nFKgVbKKLe8hjtg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] busybox: make SYSLOGD optionnal
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
X-List-Received-Date: Tue, 30 May 2017 06:36:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,


Le 29/05/2017 à 00:30, Otavio Salvador a écrit :
> On Sun, May 28, 2017 at 3:59 AM, Romain Perier
> <romain.perier@collabora.com> wrote:
>> Some distros might choose another syslogd provider like rsyslogd.
>> update-alternative will update the link from syslogd to the right
>> provider. However the syslogd feature is still present and enabled
>> in busybox.
>>
>> This commit adds a new configuration fragment to make syslogd
>> optionnal in busybox.
>>
>> Signed-off-by: Romain Perier <romain.perier@collabora.com>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> This is a good addition; once this is merged on master I would like to
> propose to backport it to pyro as it does not change the current
> behaviour but allows for better finer-grained configuration.
>
I agree, this is something that I wanted to propose too.

Regards,
Romain

