Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWAkO-0007B6-Hm
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 19:16:20 +0200
Received: by wwb17 with SMTP id 17so4228713wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=bWHiJzhr+saeFyyjTN2F9p/ArJ4RJkofP5QqQcO9k88=;
	b=fNHWIK2SDTeXylQ5tWxRTjBG8g1m9yYkucJLWsbGqVqy6u21DC1NdXOC+rp5urAboc
	JTvqQGZTqgXoi0KqSUSi//6wFK1pHzF3OEBQO6AADymaqk96z/DJFcYEmqo+USmZZ5QX
	8urtu+d4up9eYFm28qTDYNYvLxKFwQXfxDEuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=TFGzH0ZwVU8B8KBnDOGa8hP43xju5hevHLvXpp4AaLQ6lii7fMi+Zwvrj3NUT4nsUj
	XyD9m0e0bvkuqNRpwAA07krG/2XT7wqJOBnxBdLShbtJWgIxvz+WoRIBA6Bo2ulc73U5
	45AZVfRDBbJ+pmcNLi6B9Up7F0cJujQxm0/7U=
Received: by 10.216.136.89 with SMTP id v67mr2942657wei.13.1307985174223; Mon,
	13 Jun 2011 10:12:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Mon, 13 Jun 2011 10:12:24 -0700 (PDT)
In-Reply-To: <1307955075.6879.11.camel@lenovo.internal.reciva.com>
References: <cover.1307937636.git.raj.khem@gmail.com>
	<1307955075.6879.11.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jun 2011 10:12:24 -0700
Message-ID: <BANLkTikbba0xTCB=eLZamP7LY6wJ8_Nkhw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Mon, 13 Jun 2011 17:16:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 13, 2011 at 1:51 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
>> This patch brings in new patches from gcc 4.6 FSF branch
>> And refreshes the headers of existing backported patches
>> to not have git patch numbers in comments
>>
>> I am not sending the patch itself to mailing list due to its
>> large size so please review it on the contrib tree itself
>>
>
> Would we not be better off just pulling the tip of the 4.6 branch from
> FSF SVN, rather than having to keep all these patches in git?
>

there is dislike for this approach in oe-core. As the release point is preferred
I suggested to drop the minor release number and call the recipes 4.6
and use SVN
REVs to track the recipe updates but it did not fly :)


