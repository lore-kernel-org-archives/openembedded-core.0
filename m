Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id B704E734E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 17:43:25 +0000 (UTC)
Received: by igcau2 with SMTP id au2so35841634igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zVb1WmyjeDCkauO3RSWWz4lGPv94scOzdzi57fD02ms=;
	b=bStJNijw1zxDHZbkqn8JeLG1JjroflvQWpoShkMnEzB5l1YgcwVt5HoM91LUyAYA2a
	6dHbYEjKxwsKbQ4AFEIk7Hy+aZZejaCTr7gm4MsOY6BDqANJwJG1Hv+bMBBVIhgEbI/N
	o6CUHR4oqbEZ6ZUeaWciZTv8sHTUsUqK+GIO7eZ6EZZv9jpiT3I3BTRVIboqFLYQNbPo
	hM6XJ3yfTPxxKa+oWX/KSHkPBe92icwPViyP6qggjuQYqgJwMOvTt8JFWBsmgjNMCZIG
	ZNttOw6Ztm7ZhSqPIHKZxeeKyyTMe17ci/lLAODoUeWMwFmqr/jnn1F27ZEON5O6CZ0v
	BuTg==
MIME-Version: 1.0
X-Received: by 10.107.136.144 with SMTP id s16mr3507097ioi.62.1427478206481;
	Fri, 27 Mar 2015 10:43:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 27 Mar 2015 10:43:26 -0700 (PDT)
In-Reply-To: <87d23uibxw.fsf@email.parenteses.org>
References: <87d23uibxw.fsf@email.parenteses.org>
Date: Fri, 27 Mar 2015 14:43:26 -0300
X-Google-Sender-Auth: wKyWW6RdcSywoiDA8z8Zs_Ao8SM
Message-ID: <CAP9ODKpVcVXi08U=+CsR1hPkfCr4nw3v89R21xQzHCkY9xqkfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Fri, 27 Mar 2015 17:43:32 -0000
Content-Type: text/plain; charset=UTF-8

Hello Mario,

On Fri, Mar 27, 2015 at 2:31 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
...
> I also generated and checked the rpm package and observed the
> same issue.
...

I tested the foo recipe on master (OE-Core:2d923d6) and I see the same behavior.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

