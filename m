Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQSWi-0004zZ-Tk
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 02:07:09 +0200
Received: by lbol5 with SMTP id l5so2274533lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 16:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=erB/bpoB7RUtafYGncZORNckqOZQ2Y+uPguae+xmwbQ=;
	b=Uw+Kl1wg2r+nDO+kfmsLGy7fbEbBcxXzG8pk9JxgMbfAFc1hsBGM9xqbwjx6Jf9t6m
	aVkzDwyaZrGgE4TYIYvMBAM94czn4ZjXx9JbaNdGv6cxeejmueCqJsdtkKovm2tvcLZB
	WOndI1ooOxFxbSHtZrkaGpz9w4n8QCe8Ql4V6+u4yZFN8QGYsY99092l4HkdxcdXIAVy
	aeO0PqmO4cKRPZriZJ1LTr5i0Ogp+5RENrJFIBCr1QCpVW9mtM+pud94Ok6ZDmlBbRwa
	9+hrF9kPB/nvD+FdYAp0djGy/FOAOmafaEy7eSQQgFOrByMI2cR3MFZ7efewXMkvdQIN
	CDng==
Received: by 10.112.100.170 with SMTP id ez10mr3881290lbb.15.1336175841523;
	Fri, 04 May 2012 16:57:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 16:56:51 -0700 (PDT)
In-Reply-To: <4FA45D9B.8020409@linux.intel.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<bf66597d441b73ad013875abb961f185cff2eaf7.1335991900.git.raj.khem@gmail.com>
	<4FA45D9B.8020409@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 16:56:51 -0700
Message-ID: <CAMKF1soSne+tje481e25AivBB5A9ELRBpr++bexgFRD-r6HUkA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] openssl: Fix build for mips64(el)
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
X-List-Received-Date: Sat, 05 May 2012 00:07:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 4, 2012 at 3:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
> You removed the Upstream-Status:

good diving catch. It was an oversight. Fixed thusly on the branch
>
> and no Signed-off-by

it did not have before and since I just added to it. I did not add mine


