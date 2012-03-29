Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SDFIF-0000rQ-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 15:21:35 +0200
Received: by wgbdr12 with SMTP id dr12so1444296wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=exMUEc74pYLQVHlfL+2pnI2SZVUPx3DoE9HyjpQD6Yc=;
	b=E22agG90ltZ9J8YBWCctbDjUFiRVvoRhQ1AjjOeZwsaB2ApNaRzKcP7pRiWVMC2kcE
	8eVkl88eRAL9DS2GQBO2N6PbyNIzmByR0fN3grV2oBZ9OghkjJN9rMIXEDpuuO0oUjqG
	jJYGcVs789UZhD9nAO5Eb892sraLTPK7PjkpmqPYhThZe/QlL40sth5fkhVMKObG0I1D
	3xJNa0jt65RXJGmlc0W1s5fhdef7uFHxjFnhLBZAgUTC1dwBGAuBuZB4kDVXr/WTv+c2
	imyR2lcstVYl2intP/dl49fY9RmVJ54XNMxE1jVWgDrCAZYSI5O1W7MtO3CLZoKbXHWK
	DIlQ==
MIME-Version: 1.0
Received: by 10.180.79.72 with SMTP id h8mr5645277wix.1.1333026752030; Thu, 29
	Mar 2012 06:12:32 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 29 Mar 2012 06:12:31 -0700 (PDT)
In-Reply-To: <4F74530D.10408@opendreambox.org>
References: <CAGiJk9esiphHKT9GaH8dLgOFB_xbLDr86PX-rzzsR8X66OVNaQ@mail.gmail.com>
	<4F74530D.10408@opendreambox.org>
Date: Thu, 29 Mar 2012 15:12:31 +0200
Message-ID: <CAGiJk9f0=rY4cfJtKbWYWho-A++j==8T7RkyiRguKxxDtj_MfQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetching code via git over ssh.
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
X-List-Received-Date: Thu, 29 Mar 2012 13:21:35 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/29 Andreas Oberritter <obi@opendreambox.org>:
> On 29.03.2012 14:13, Samuel Stirtzel wrote:
>> Hi,
>> as I have set up a git server on one of my PCs and secured it with ssh.
>> I tried to use the repository in a recipe, cloning via "git clone
>> ssh://user@server/~/repo.git" works.
>> But bitbake tries to fetch the repository via scp instead of git (also
>> if I add protocol=git).
>>
>> Tried something like this in my recipe:
>> SRC_URI = "ssh://user@server/~/repo.git;protocol=git;branch=master"
>> (note: the git repository is in the home directory of the user, so the
>> tilde is not causing an error)
>>
>>
>> Anyone else tried to fetch a repository on a ssh secured git server via bitbake?
>>
>
> Use git://user@server/path;protocol=ssh
>

Thanks it works.


-- 
Regards
Samuel


