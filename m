Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id BACD07646E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:04:06 +0000 (UTC)
Received: (qmail 24365 invoked by uid 1003); 18 Aug 2015 16:04:05 -0000
Received: from unknown (HELO ?10.56.29.23?) (philip@opensdr.com@88.128.80.29)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	18 Aug 2015 16:04:04 -0000
To: Christopher Larson <clarson@kergoth.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55D35731.1070808@balister.org>
Date: Tue, 18 Aug 2015 18:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Tue, 18 Aug 2015 16:04:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/18/2015 06:00 PM, Christopher Larson wrote:
> On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson <clarson@kergoth.com>
> wrote:
> 
>> Bringing this back up again, as I think we really need to at the *very*
>> least pull in iw from meta-oe into oe-core, and adjust packagegroup-base
>> (worst case, with a VIRTUAL-RUNTIME), and better yet also drop
>> wireless-tools / move it to meta-networking.
> 
> 
> Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, as a
> temporary measure, but I think we need to get iw into oe-core and into the
> base images for sure.

I agree completely.

Philip

> 
> 
> 

