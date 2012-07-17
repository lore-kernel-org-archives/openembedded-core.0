Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <damien.lespiau@gmail.com>) id 1SrGaf-0002b6-Ob
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:50:01 +0200
Received: by vbbfr13 with SMTP id fr13so664624vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/aRcO8Qgq4MQ18Y0odvNJIx28xvbugZISCV1sfY0xBc=;
	b=iDKj0BQO8lrPX3r6kboKRTBt8QFkH/emVcQ2RE9VLCKs+PevaSdkaSZGSq5CQC4aAK
	mG1LxzjdEfUgKoP+kM7GJDc884YX+YwWF/jYhs4iQITVXltj6cdRK8KevDb5+mSYO6i7
	oi51BlRn5cXANXH6c3J4tnA9pkfdLUcVwttzfddz2IGSSZPeNgSnKJyfHz5F/vEaR6H2
	dwSJPXWMzxlbbHg3Oc938XfmSTNY9R7PqP7kXdduIoFk09kKBrka7XhC9VRVlWZIpdQg
	CPSlPxiu1bO2DEC/9ANRAGz4RJ0zRMcl+Jc8FAOYh3/bLFjG1CxHpCvjAw+Z6lYnBZO6
	ugEA==
MIME-Version: 1.0
Received: by 10.52.176.170 with SMTP id cj10mr1875388vdc.31.1342564721239;
	Tue, 17 Jul 2012 15:38:41 -0700 (PDT)
Received: by 10.58.240.73 with HTTP; Tue, 17 Jul 2012 15:38:41 -0700 (PDT)
In-Reply-To: <1342564161.6448.38.camel@x121e.pbcl.net>
References: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
	<1342564161.6448.38.camel@x121e.pbcl.net>
Date: Tue, 17 Jul 2012 23:38:41 +0100
Message-ID: <CAGrt=7iSPGgFGeYUfEMhD8MBpx0mYJm_1vsEBJ8JruAjBpgs2A@mail.gmail.com>
From: Damien Lespiau <damien.lespiau@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: Re: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 22:50:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 July 2012 23:29, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-07-17 at 23:23 +0100, Damien Lespiau wrote:
>> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
>> +SRC_URI = "http://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
>
> Er, really?  Isn't "protocol=http" enough to get the svn fetcher to use
> http?  What version of bitbake do you have?
>
> I'm slightly surprised that "http://" even works here since there is no
> obvious clue to bitbake that it ought to be using svn for that URI.
> Won't that just give you a download of the html index page?

Fair enough, the patch is then totally untested, guess it's a bit too
late to try to send anything. The actual tested change was:

svn://svn.eglibc.org/branches/$branch_name

and then went ahead and made false assumptions about how bitbake was
going to do with the URL.
What I have here:

$ svn co svn://www.eglibc.org/svn/branches/eglibc-2_16/
svn: E170000: URL 'svn://www.eglibc.org/svn/branches/eglibc-2_16' doesn't exist

$ svn co svn://www.eglibc.org/branches/eglibc-2_16/
A    eglibc-2_16/ports
A    eglibc-2_16/ports/ChangeLog.tile
A    eglibc-2_16/ports/ChangeLog.cris
[..]

$ svn co http://www.eglibc.org/svn/branches/eglibc-2_16/
A    eglibc-2_16/ports
A    eglibc-2_16/ports/ChangeLog.tile
A    eglibc-2_16/ports/ChangeLog.cris
[..]

-- 
Damien


