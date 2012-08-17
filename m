Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2Jkh-0000jg-5V
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:26:03 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 03:14:03 -0700
Received: by obceq6 with SMTP id eq6so4418352obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 03:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=t+0PQjFh0wCGb7fjh0FOQYKYreLfXHMx3167kKjFht0=;
	b=ERtvtMj+3L8h+irpniF9LvlWB07QHyTnTbRKORGCyv6Od2e07iQmncRCbbOdpaaOfT
	j04TvXf3d7y86kQ3i2LoXtDiXYPKJhRFerLlRL7cz2br2J7MO5/bLwIBZcDcex4rdZf5
	cwJ4aIFFs09vLnwGzeeflMk0ShXZ9ZkIbE2whU0DSGz331rsPYDvy14gx85ePOKol8n2
	YULnOYu/XXnqsWQuEoSkC2xemzICz1trRIHdNzB1/VCzD/r0tlnAFNMGO+ljp27zOKHm
	8cVkedtnslE/iDdPrrsgbu0f2QXn66BwVpiKLbaUjpLnPhaq3SYVJ3c10ptQ+UkWEOLo
	QsOg==
Received: by 10.60.28.162 with SMTP id c2mr3538432oeh.3.1345198442041; Fri, 17
	Aug 2012 03:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Fri, 17 Aug 2012 03:13:41 -0700 (PDT)
In-Reply-To: <CALbNGRSsFXRR4eqY_EDJmtdOzxnPU7i+vVqbbbL4zRg6YhVGLA@mail.gmail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
	<1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYBdGj1ANujgM0f0mU8OE5XXovegKzQqVhXROT=qa=6ZQ@mail.gmail.com>
	<CALbNGRSsFXRR4eqY_EDJmtdOzxnPU7i+vVqbbbL4zRg6YhVGLA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Aug 2012 11:13:41 +0100
Message-ID: <CAJTo0LY1MHvGKfVpH_Y5LcAJyEbKW+VvtAoiE2GKQG-dpXKnWQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkTAzo79ntjEioAbK3uftXX4VZjUt2nnfXaN59UT6ooIs7fUqf0p6+U8B2SSLBWbSVO4ytV
Subject: Re: [PATCH 2/2] webkit-gtk: update to 1.8.2
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
X-List-Received-Date: Fri, 17 Aug 2012 10:26:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 August 2012 10:05, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
>> Did you chase upstream about this -- I presume it's a genuine mistake
>> (maybe the tarball was re-generated) but I'm curious.
>>
>> Ross
> I did
> * use the 1.8.1 hashes and let oe tell me the new ones
> * add new hashes in recipe
> * bitbake -ccleanall webkit-gtk
> * bitbake webkit-gtk

That's what I did, but that doesn't mitigate the point that we should
be validating checksums where possible.  I just grabbed someone on IRC
and they think that the checksums in the mail are for the wrong
tarball... :)

Ross


