Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1Tv2j2-0003h4-Hw
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:22:34 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so3545846lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MnSHzRdQx9Ck4gy3yKFxYkhCSdmbPvHU2BjJd2GoeNA=;
	b=xOMifO8C7tbuC/ScJpHGLs1mP8ezZsvbvMvN5Mqt8ZD+18upDDb1/P9klh+lLEr2pb
	2isQfKk6hxpvxH5ZMLjMgmsG7UqZD3Nt6sYnB+zAoUAY1Z8rKQHPg7trBsOlS/98QCTU
	tAAM4/j9rTrrye0hjWZrVYt2mw70CFiJ1n0Za6r+1Q3h+qDOOCeNJ9ikcD4QxkvdBqsI
	CMeDaIiHT2dsvs3QGu76UiMxWcJ/hHho+NeFAa62AJFYlR0z6cKRuEcYe3R3QdGWIYKF
	to4ZL6k1WYluXVNc0FoC5Nu0VF0B963t62iPcsOK+1ccPbIkoN+ZkHsyX1pNaK0UX65C
	tkvw==
X-Received: by 10.112.25.100 with SMTP id b4mr34792859lbg.37.1358240832511;
	Tue, 15 Jan 2013 01:07:12 -0800 (PST)
Received: from [10.54.86.72] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id bf3sm6391149lbb.16.2013.01.15.01.07.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:07:11 -0800 (PST)
Message-ID: <50F51C3D.1070904@gmail.com>
Date: Tue, 15 Jan 2013 10:07:09 +0100
From: Martin Ertsaas <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121128 Thunderbird/10.0.11
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
	<1358237694.23113.17.camel@ted>
In-Reply-To: <1358237694.23113.17.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] sanity: Make the required utilities more platform specific.
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
X-List-Received-Date: Tue, 15 Jan 2013 09:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/15/13 09:14, Richard Purdie wrote:
> which will then simplify the other part of the patch (make it
> unnecessary).
That is true, will make it a lot simpler.

What I know is still missing:

1) There are some errors with the paths, seems like stuff is not
correctly transfered to the sysroot, this is next on the agenda.
2) Make a class that does what chrpath does, but for install_name_tool,
going to do this as soon as I get an error on it.
3) Probably some errors after I get past the error I have now.

I agree that we should not merge a ton of these patches.

For my part, I can keep these in my repository until I have stuff
working. When we can compile everything I can do a pull request. If
someone wants to help, they can just pull from me and work against that
repo.

- Martin


