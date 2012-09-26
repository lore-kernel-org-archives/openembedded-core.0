Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGsq5-0003D1-Q2
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:43:50 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 07:30:57 -0700
Received: by obceq6 with SMTP id eq6so648730obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=x7n2RbVE1svbJfeS5hKEdfBe0K1CW7g1/fikm7L/f20=;
	b=JWuarGgccCpg+3TCh2feGyhUkL2FoG+Qa49BouWkA0Rcu2RuPmhfnmjqU4xK0030+K
	hlpcWewTs4MljGHdHAiMgHNcD9N3x/HSVL59V6dj+ecJpS3N8vIPtRpUxiG8/Qxl/Y3T
	XaTau2k6XUO/Y4JSClaY2jqsU/JEA1Vk4aaebWfMfsbCwrolFGTInYn/8AqOjy8PIoNz
	7EC7B/6rueGoMVQ4gr51VOl4ZzXEy1nAyJHsRoweLtJndniTeAdGvlYbD4f0P8MQucDG
	ECkocUTEiKLmp7rHKb/lV30rBLlkxEZaDizLowuF4pULfl3hKa0g96+fmB7SQ19NvduU
	N3IA==
Received: by 10.60.12.106 with SMTP id x10mr525460oeb.103.1348669856589; Wed,
	26 Sep 2012 07:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 26 Sep 2012 07:30:36 -0700 (PDT)
In-Reply-To: <1348669701.31293.116.camel@phil-desktop>
References: <1348661842.31293.108.camel@phil-desktop>
	<1348668794.7240.4.camel@lenny> <1348668853.7240.5.camel@lenny>
	<1348669701.31293.116.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 15:30:36 +0100
Message-ID: <CAJTo0LZbOto+ZD05TFiQ0r=DmYWxM-H_R9LYrFBedzTm3g0tiA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQky5pSRY5xQs1sbqE9NGBKbIBnvTyJF2ymrNk780lDqkfaLGhvkXfY/02uWQVJEZGjdHEIZ
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:43:50 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2012 15:28, Phil Blundell <philb@gnu.org> wrote:
> That disables all the tests, right?  I wasn't entirely clear whether we
> wanted to do that or not.  If we do then yes, I agree, that would be a
> way to avoid the nodbus.patch.

Well, we can't run them, so not much point in building them.

(yet. this is a prime candidate for a better test for the ptest proposal!)

Ross


