Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TOTcw-0007aH-To
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 15:25:39 +0200
Received: by mail-qc0-f175.google.com with SMTP id j3so5981335qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=iTY7bRWauL+yHAUtWldkhfvFJ3pmAsccR+4qgt+hzEI=;
	b=c51tK0MAEnsuJ4BK8lAX1Yp89BLTZOvFAtUxwEOM4kkZdR52uLSIa1paQY0HVTCK8q
	KMcjswlJQm+hI3WvxXxdSzvUbOdM0i6rSs2ScexAgPIZKAqUHcPoiH+0v51yEYs5IUbY
	ZNcaV3nnEt0ndvhV6WixcsU+zQ8Sd3Gs+zfxuqfQP4UcUcg7zaTPvv9Q5jrzKhvISlyL
	OwvDu2v86xiB+v3OCQjA2l+RfxPay8dQ8QTZ6vqI2P3NDXRvmn2TooXRT22gWMIz+7VT
	jKHd18dJZ/t/L+uaG6i/S/c3enQ1C3UJyPco1Q6QuWr0jyHzWb73EqOivUGrRza138Nb
	NuCw==
Received: by 10.49.127.115 with SMTP id nf19mr42330656qeb.36.1350479540370;
	Wed, 17 Oct 2012 06:12:20 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id jw1sm19642264qeb.13.2012.10.17.06.12.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 06:12:17 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Wed, 17 Oct 2012 09:12:12 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
	<1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
	<20121016223739.GB3405@jama.jama.net> <71077863.US7FUzvX2E@helios>
	<242F788A-5F02-496B-B9DF-F8F3B0633992@gamestop.com>
	<20121017073136.GF3405@jama.jama.net>
Date: Wed, 17 Oct 2012 09:12:12 -0400
In-Reply-To: <20121017073136.GF3405@jama.jama.net> (Martin Jansa's message of
	"Wed, 17 Oct 2012 09:31:36 +0200")
Message-ID: <871ugx9r9v.fsf@sonatest.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Wed, 17 Oct 2012 13:25:39 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

> On Wed, Oct 17, 2012 at 12:29:21AM +0000, Patrick Turley wrote:
>> On Oct 16, 2012, at 6:28 PM, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> 
>> > On Wednesday 17 October 2012 00:37:39 Martin Jansa wrote:
>> >> On Tue, Oct 16, 2012 at 05:47:26PM -0400, Marc Ferland wrote:
>> >>> Adds the lm_sensors applications. These consists of:
>> >> Is it really needed in oe-core? why not meta-oe?
>> > 
>> > I'm thinking meta-oe is the place for this. As a bonus, rrdtool is already 
>> > there.
>> 
>> I am not qualified to have an opinion either way - but I *am*
>> curious about the motivating rationale. What are the reasons that
>> this should appear in meta-oe?
>
> oe-core as *core* for other layers, should have only the most important
> metadata which are needed for all other layers, like toolchain etc.
>
> A lot of embedded images does not include or need lmsensors, so it's
> kind of extra package which does not need to be included in *core*.
>
Thanks for the clarification Martin. But looking at
oe-core/meta/recipe-bsp I see things like acpid, libacpi, pcimciautils,
etc. I am wondering what makes lmsensors so much different than these
tools?

Regards,

Marc


