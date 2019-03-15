Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 110896B8AC;
	Fri, 15 Mar 2019 14:27:59 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id y6so8355356ioq.10;
	Fri, 15 Mar 2019 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=8FruvjQVq6OjAI+Ss43BhvwoLFs/UkFHL2pwOCYKkwE=;
	b=UuOMRyM3Y/Ll9ew5btSTh5/WBPosHh2NUhZNqzuCfKTu0cvLIH3AvylAH97WbCVGYc
	bLqsNREE5Ilo/Wnaznk0x8A5updUJNXe3+OSOxo5Du3G3TtUiIB1ALyF9j0rbhO7WxNH
	NddXbZBp8CZBvXBbEVPVJ5qff+AV1rJsunixhZRjF1R33vNwFlBoG0LqGdVQMls0VPHJ
	ab3yWyDwSuzNV7aB3bxdRvvA/OlA1mrEZsFyHotnr75L6NGpd/i3/zCj8/p8vDP94N0U
	mrGjfOP+lGIWTsn3kBSCMwEGmU2CEhVcQpyXJ5UuwmFy1raKg5p0UJMNHW0dPxvlPZW+
	WXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=8FruvjQVq6OjAI+Ss43BhvwoLFs/UkFHL2pwOCYKkwE=;
	b=jIEoSndhd1FO8kRYmUEFLPmws9H0GJdu52VXCWTTVbjZXDFn5CTwCfno5MMvLadpU3
	Sjj5Xu3jy1g1iyGiixk+dQg0sVuKJ/ve3UhHebpN6OEHJNw5TFHn3QJeUQEMoyfFzkRJ
	ftqvcZSDoEtnNe9Bp62qeSWm2HfYJKQgnUvIQqhUkwk9ldI6hGA8RJUU5ffHEz1Fue0o
	v1YzolmHUXK0dx4MLgQYKl1nb5HKVuwr2+BeeoviS8eFTF1WMdohfkIjJLWcFsZ1FiWj
	xqZz6oy5qeNYtW0R/HQFkWxB8Yo2YZ2xfnMUKxKvCfoY7R+aFHkIr7qY14BvM7R9izAS
	eIqQ==
X-Gm-Message-State: APjAAAUP96dHK5UrZyFv7R+YxbFzcQscgmhUn2w7Kwc5/U57uR/nwMld
	y4cbaJVtHztrPzz9gN9hAPI=
X-Google-Smtp-Source: APXvYqyyfc6DHU+v11X4L3NgLwkrzw7z6BvYVSJ/Tt9lq7OV2QiC7lKEZ47oNfso7YCy/a6LccJ39w==
X-Received: by 2002:a5e:c004:: with SMTP id u4mr2511376iol.13.1552660079990;
	Fri, 15 Mar 2019 07:27:59 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id i26sm776078ioj.86.2019.03.15.07.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 07:27:58 -0700 (PDT)
Date: Fri, 15 Mar 2019 10:27:53 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20190315142753.GA10387@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: OE Summit report from SCaLE17x
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
X-List-Received-Date: Fri, 15 Mar 2019 14:28:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Earlier this week I got back from SCaLE17x during which I taught an E-ALE
class on Buildroot, was a TA for the other E-ALE classes, organized and ran
the first ever (hopefully of more to come) OE Summit, and gave a general intro
talk on OE. I wasn't planning on giving an OE talk at SCaLE, but the person
who was supposed to talk wasn't able to make it. I had travelled to SCaLE with
a backup talk prepared as a "plan B", and it was good that I did.

I'm quite happy with how the inaugural OpenEmbedded Summit went. Everything
went off without a hitch, and there was a lot of interaction and feedback
between the speakers and the audience.

We had 4 speakers:

	myself (Togan Labs): Using OE
	Drew Moseley (mender.io): Mechanisms for Enabling and Configuring WiFi in OE
	Alistair Francis (Western Digital): RISC-V and OE
	Jon Mason (ARM): Kernel Development Workflows Using OE

Counting attendance is a bit tricky because people sometimes wander in and
out. Do we count someone who wanders in partway through but leaves before the
end? My talk was the least attended. I forgot to count the audience members
(since I was giving the talk), but I did notice that a couple people wandered
in during the talk. Behan counted 12; like I said, I didn't think to get a
specific number myself. In any case, my talk wasn't in the programme, since I
was filling in for someone who didn't make it to the conference. Drew's and
Jon's talks had roughly 20 audience members each, and Alistair's talk was
about 30.

It's too bad the OE Summit was pitted against SCaLE's "Embedded Track". I
think we ended up "competing" for audience members between the two of us. The
OE Summit was put in a rather large room. Between teaching and helping out
with E-ALE and running the OE Summit, I didn't attend a single talk at the
conference nor spend time in any other part of the conference except for
these two rooms (which were beside each other). I have been told anecdotally,
however, that the attendance numbers we saw for the OE Summit were in-line
with the numbers of attendees for several of the other talks, but I can't
comment personally.

As we were still setting up for my OE talk, the very first talk of the OE
Summit, one of the audience members put up his hand and asked what the
difference is between "Yocto" and "OE". We weren't specifically prepared to
comment off-the-cuff about the relationship between the two projects; it's not
as if we had a prepared statement to read on the topic. We tried to fumble
through a satisfactory answer while remaining as neutral as possible on the
topic. But it sure would be great if the two projects could get together and
put out an official statement on the matter to which we could point all such
curious people. Interestingly enough, this person was sure that The Yocto
Project pre-dated OE, which we had to correct. Then he assumed these were
two projects that had simply forked from each other at some point in the
past. It was probably actually more confusing to him that OE and YP are
two separate projects, but with almost all the same developers, working on
almost all the same code. In any case, The Yocto Project's Community Manager
was on-hand, thankfully, and I don't think he had any objections to any of
the things we said in answering this question.

My talk was a general introduction talk about OE, but all the other talks
assumed the audience knew something about OE. This turned out to not be the
case. Pretty much all the speakers had to field questions along the lines of
"so what is OE anyway?". Sadly, in many cases, saying "it's like Buildroot" is
often what would help the person asking the question the most. I think it's
noteworthy that more people seem to know what Buildroot is, but not OE/YP.
Although I realize this is just one conference, and a very small sample set,
so it wouldn't be fair to generalize from these numbers. But it is true that
these are the sorts of questions we were frequently asked, so it's noteworthy
in that respect.

Oddly enough, when I was finished the slides portion of the Buildroot class,
the very first statement a student made was to complain about how terribly
difficult Yocto is to learn and use. Why this came up in a class about
Buildroot is confusing to me too, maybe he looked me up online and found my
affiliation with OE? I don't know. I was careful to not mention the words "OE"
or "Yocto" at all in my Buildroot talk. In any case, in his opinion, using
Yocto requires a masters degree. Obviously he's exaggerating for effect.

I'd like to personally thank the speakers who agreed to give a talk at a
conference that didn't exist prior to last weekend, who worked hard on their
talks, and who put together some very interesting presentations. I think we
all walked away having learned a bit more about OE. I'd like to thank Behan
and Tom King who helped organize. Behan who setup his recording equipment to
record the talks (just in case there's an issue with SCaLE's recordings).
SCaLE who hosted the mini-conference and helped with advertising (i.e. putting
up a page and re-tweeting). I'd like to thank the OE Board of Directors who
gave me permission to create and run a mini-conference on their behalf.
Finally, but not lastly, I'd like to thank everyone who attended!

Thank you, and best regards,
    Trevor

