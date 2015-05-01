Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9A673E11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 20:17:43 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so96410189ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bF+1g3mhg9T4RzWAXHHEXAHjZ9vpxzQshC98PAbaq0c=;
	b=rFGc2hOCkWJPCNiwPyj74q7pIdxCIqdQHcLjyeJXkiPBuHCdpTkGUlqTSncFlnAJUF
	6YZuUIobGx+ZGMTniVwe5+hdVG5C5QZoVIHOcGD9dz/eXqigv7z+qhx0rHGblzuhOW5A
	U7Yotz5wHQXA3UiRjxoNG+T8Ks0mR+MyKJL/9oR1GVhGU+g/iWNkOqZrQSgu9b30w7fO
	w/NFbwhY5DubChDPs5E7peOhFx4bh8Pkju4v6ZX0pIT3u40zLR1QY73e9JHf0+LmT1Kd
	hI3nchllZNeATDdQXhGHGlctG6CI5ATe4H2ZlnbLiX9gcnZJ5DTzO8ZCraNNXKViZTwL
	3rww==
X-Received: by 10.50.13.5 with SMTP id d5mr6506159igc.4.1430511464567; Fri, 01
	May 2015 13:17:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Fri, 1 May 2015 13:17:14 -0700 (PDT)
In-Reply-To: <CAJTo0LYNKMRhUXX5O=ggk=MC1g=4PSszEQx+uj0Fa6er_LZp4g@mail.gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
	<CAJTo0LamJfd_=oqKfiAvoRueB=7EQu5GCYfaQO1r3ADnNdjQzA@mail.gmail.com>
	<5F36DEAE-E6AB-4E52-A105-B48B0B1CCD9B@gmail.com>
	<CAJTo0LYNKMRhUXX5O=ggk=MC1g=4PSszEQx+uj0Fa6er_LZp4g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 May 2015 13:17:14 -0700
Message-ID: <CAMKF1srO-GSA+LHTAeq3BdWK1RBd5JxTr=dnS_Z=hkJZDXdE1w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/14] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Fri, 01 May 2015 20:17:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 1, 2015 at 1:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Requiring a fresh install of Python 2.x when we can just force the python
> version seems overkill to me...

not all python2 versions are same as well. but may thats not affecting
this case I am not sure. But for improving
first time builds is probably a good reason at the expense of determinism.

