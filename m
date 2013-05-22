Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id A61556065C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 12:05:51 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id q12so1226682vbe.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 05:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AL2zQ6EkSvxlxaB5sDemQh44jVK2J4kqi6YsPb2hLJA=;
	b=RaqNVV+jjzetFrBWQYvRqGW3YuLfaF5MmQIELhVJ8DyLreCmyIOdPxZOKOLnlQ3pw5
	j8o/T8moSQXT979a7EOv/0isCWq2RQPKbPggy58pV+cU3rj+D63hCSHNv8zaV0reZMMV
	5y968/DifL75Rxgvrz6ZGCEIevHjUqYNqGNtDaLiP1GhQ18Wt3UG1tJa3rc8RvPEEjme
	KMS5WylsaPLdzHPC5PMJ4a6O0sq1dfE9wwI8ijM8ZkSIB9JZFiaG9/VOOKTsC5GFX7JG
	ahD1i70Rc6OWDQ7erCq+oScWGRxwfa6Ay3x1P37WynDFL3/kqMvPSkcLPD5H2JMmYaJZ
	VwAA==
X-Received: by 10.220.248.137 with SMTP id mg9mr2670730vcb.38.1369224351968;
	Wed, 22 May 2013 05:05:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 22 May 2013 05:05:31 -0700 (PDT)
In-Reply-To: <1369220302.6695.72.camel@phil-desktop.brightsign>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 13:05:31 +0100
Message-ID: <CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQnVNFZkNS+w9Eyfft5xlfkCVa+MJJ76QvJHRruUJX8dMUjKVMryPIB5yJN3pU/CF/DufhBW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 22 May 2013 12:05:51 -0000
Content-Type: text/plain; charset=UTF-8

On 22 May 2013 11:58, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2013-05-22 at 13:57 +0300, Bogdan Marinescu wrote:
>> +RDEPENDS_${PN} = "glibc-gconv-iso8859-1"
>
> That will make it unbuildable with anything other than (e)glibc.  Is
> this ok?

Presumably in this case libiconv will be used.  Is there a standard
way of depending on a specific encoding from either eglibc or
libiconv?

Ross

