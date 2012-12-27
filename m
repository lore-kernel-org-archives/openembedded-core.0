Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToICM-0007Vc-Mp
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 19:28:54 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so11930555ieb.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 10:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/3diw8EHQlkLoINlSUFcCs1i5OIRXT1MdVN1IP9zGFA=;
	b=PsHe8+8m11SEuWl113GZG8RccPoZEVvi/GljmKUCZPrdwHNCMi4MCmhm+XVXsAUpD1
	p9QhH3FtTQvHaFPPDOZR7S7d+9amyz+qYmCqGlaEY6UrrJTONyh1PgRjnf44J+GNCbU6
	yvOyb2sFNb/WT6mzKy9xMCv+Xn/w58M3sW+8dstf+Hj872oiYb7brfNL5jCv8OM8Nb/D
	4g7sKFoPFNV2ONuGXlBX5IBPZQW9Wo0ip0D/dXtlKCF4wfqf+T3lmygB08JaeLGDno6v
	uw0ebU6CTcOSmXufvIsf5c7uZyHyiRqDDw5OmWJDVfWcDqS7Otaoqkw15CwMrw20d3Zd
	wSPw==
MIME-Version: 1.0
Received: by 10.50.91.169 with SMTP id cf9mr27737171igb.44.1356632039690; Thu,
	27 Dec 2012 10:13:59 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Thu, 27 Dec 2012 10:13:59 -0800 (PST)
In-Reply-To: <50DC727B.5000103@linux.intel.com>
References: <1356606431-31942-1-git-send-email-cazfi74@gmail.com>
	<50DC727B.5000103@linux.intel.com>
Date: Thu, 27 Dec 2012 20:13:59 +0200
Message-ID: <CAF6bG8de7mX0iWsYRXgQ06P1e4zv3KeD-7bTtHvL2hB3-yO5yQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gettext: update to upstream version 0.18.2
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
X-List-Received-Date: Thu, 27 Dec 2012 18:28:55 -0000
Content-Type: text/plain; charset=UTF-8

On 27 December 2012 18:08, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/27/2012 03:07 AM, Marko Lindqvist wrote:
>>
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> ---
>>   .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58
>> --------------------
>
> Why are we removing this patch, it's important to note this in the commit
> message, did the upstream take this patch or change the code??

 Sorry, I forgot to amend commit message to mention that upstream has
resolved the issue the patch was for. I'll send updated version once
I've finished testing of some other patches.


 - ML


