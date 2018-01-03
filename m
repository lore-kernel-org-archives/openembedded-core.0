Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA4778055
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 10:40:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03AePSo005315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 10:40:26 GMT
Message-ID: <1514976025.5525.111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Juro Bystricky
	<juro.bystricky@intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 10:40:25 +0000
In-Reply-To: <fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
References: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
	<1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
	<fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
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
X-List-Received-Date: Wed, 03 Jan 2018 10:40:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-03 at 10:47 +0200, Alexander Kanavin wrote:
> On 01/03/2018 01:16 AM, Juro Bystricky wrote:
> > 
> > Improve reproducibility by making sure that timestamps
> > in built rpms are not later than the value of SOURCE_DATE_EPOCH as
> > found in the environment.
> > Timestamps as usual when SOURCE_DATE_EPOCH is not set.
> I'm not sure I understand the necessity of this. What matters for 
> reproducibility is that rpms install the same files; why is it
> important that the rpm file itself has exactly same build time and is
> otherwise identical bit by bit?

People have different definitions of reproducibility. For some its the
end binaries on the target system, for others its identical rpms.

Its certainly true that producing binaries that are more similar does
help us in a number of ways (e.g. churn in package feeds) so if we can
improve that without causing serious complexity issues, I'm broadly in
favour of it.

Cheers,

Richard

