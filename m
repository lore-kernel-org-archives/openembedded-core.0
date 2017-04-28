Return-Path: <ferlandm@amotus.ca>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0112.outbound.protection.outlook.com [104.47.33.112])
	by mail.openembedded.org (Postfix) with ESMTP id 5349E77E51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=nn74u9rn4NQO5jZ6WJurM2McUVtJ29bceovkwqZ5HMA=;
	b=xgDRdCO6BE1mG7E16UQYdezMGSiReQt+9Ow/xHGEmdDwQNEcKnJVNfcTW1bWIVrrcEwG5KD+GsX4vuIslz2PxAjely6309esboxzLmXxq72UHJCoMuvxJR+sgjP7v8r5qZXSYm5QHqby8LAkueUqKevDusPIgVELktqbcPcOR+Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-ua0-f173.google.com (209.85.217.173) by
	DM5PR11MB1674.namprd11.prod.outlook.com (10.172.38.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1061.12; Fri, 28 Apr 2017 18:01:22 +0000
Received: by mail-ua0-f173.google.com with SMTP id e55so11400581uaa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 11:01:22 -0700 (PDT)
X-Gm-Message-State: AN3rC/7THRqhUYiXLp9w1WNAxl2u9nmPZLVEY2gQqI3aY2CLs/jg9MP8
	UGSXyAWGR/h1yAVhZ8oea05DiQwpcQ==
X-Received: by 10.159.37.248 with SMTP id 111mr6901001uaf.146.1493402478620;
	Fri, 28 Apr 2017 11:01:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.144.65 with HTTP; Fri, 28 Apr 2017 11:01:18 -0700 (PDT)
In-Reply-To: <CAJTo0LYbd9c=hAPRtQpLEpHPMnO-yoRFvvJ58-K+ZwWmVUiuMg@mail.gmail.com>
References: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
	<1493385304.3156.5.camel@iki.fi>
	<CAJTo0LZsEnqepWkqtEubN04A6+XYzcj+wpATT8jg20pGk1hF4w@mail.gmail.com>
	<CAJTo0LYbd9c=hAPRtQpLEpHPMnO-yoRFvvJ58-K+ZwWmVUiuMg@mail.gmail.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Fri, 28 Apr 2017 14:01:18 -0400
X-Gmail-Original-Message-ID: <CAMRMzCA9gE7M1NGgkF=DpnHd4sAF3aAHo=guuhY7yEWQieYo4Q@mail.gmail.com>
Message-ID: <CAMRMzCA9gE7M1NGgkF=DpnHd4sAF3aAHo=guuhY7yEWQieYo4Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Originating-IP: [209.85.217.173]
X-ClientProxiedBy: BN6PR20CA0045.namprd20.prod.outlook.com (10.171.173.31) To
	DM5PR11MB1674.namprd11.prod.outlook.com (10.172.38.21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a39236b-76b3-4d56-25ff-08d48e609454
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:DM5PR11MB1674; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR11MB1674;
	3:op8EmkDP+jBrBtOdr8GxekZIYnX9GN365bxGAW0MtmeRzkXnPNvBjouS26nzWASsRN7Nhrmx+5DvreVmmRBcDjtl2dbnzUvnDlmSst/b/XG6KYQaOZ6TOedJle7l8U4cP3nWoV4eoVAqoJ50rB9enjH45PzC+SCRZXXV8dDK49hRZ5x8vT1eYDEhFwVAf26aNzkjXg1SrtWJMtjCwl4KljzJ+7k7iNjeEEcVQ/fNBzXJj4/2Z8OoN5fCbQlOCO3w3uTlLVe31Lq3I25/aVQuoxYTSMi+5rG/owaNwEeYtks4/K5xeuaKn4tiFl8jWT+7;
	25:cuYWVAk0ItkQa/K3zVwpQySwoFbd+hja9RRRo7kBsyZF4w4xJVaMsdnd4J9lr+nJr2gxVt+l/nxpo/sDet8Jo1rYVG9mcgpOs1DdNRtv16oQga1DAoE7bc3414jXsj28i8AitmR9quoT+a6phPHDw4lfPxf0uHrjOc0eGBzGQLdXWWuXyJzNYTq4Dm93D5yJSHEap+v3Ji0l3XtI9ajM9q5Rs/mLA2AIEi6TPaoZOPwklPKVX1L9trOFNbtTeHkEVi5qB0dMIdRBIyEzsSjSFfG6GrYyPc08tfoyfFwDQK9GP5w7LkpV6sGRkF/vR/P+0Odtc8t9GZ4JQYU5umk4QkDicZkymfIXolCLKRyOJJJveJaCo+f5l+kRw6VbwkA73bA3a2Wl5nKlOqQMXBe2IHWbaGSdd9Al2D6hoTv4CoURc4kNQOm075mFbYVryQA3DllqgNQaDnfn3JdpSI1ltg==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR11MB1674;
	31:O9UOH2XicwksLNGxd6PEFMG+4PI1n8jJ9WRxwdJSzP37kxsJIhgVALv4GvrGqXLAqzeuCcMf54y44bko03va2J126Jl+BUOfDWKsYKV6peiMC6O0cPBo3sNcoliM7NBMnbZgHWaUgonBfJb2i6Yk81a+RFjs0qq06xVrOesXBJYB2PTvJFe8M8m3HJypR/jXJMSLkq/KDYOK7ExHQPDVZc+fyOrT67LcKgIjCiuNFBE0tZfOnE3IR/GgZiFOAqjq8bkmzkwpn8RF/o4TuqIh5Q==
X-Microsoft-Antispam-PRVS: <DM5PR11MB1674D2B6E9090A3ACFE38732DC130@DM5PR11MB1674.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123564025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(2016111802025)(20161123562025)(6043046)(6072148);
	SRVR:DM5PR11MB1674; BCL:0; PCL:0; RULEID:; SRVR:DM5PR11MB1674; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR11MB1674;
	4:lO4uoAR3GhOzSUFpGWFiJ0AClI7lZmhtTngrHRb/i4NeUzIQvvpRhieSFXJIoUBHCpWNRyhGr7rGVvP3U+EE8BNqBkrrPLHTJ9vfI9Qzi5OSIAxRo1YW0GM0cR0jBIJKBti3rPsFZaZTIq1wJmJfyB/M9gfUi+6j2QVTm+Tu+hvgPviDwmJTgSvD/RLoid5y1LUae4q3hTqkcdmKBAfoDPbI8aAmGW23jfFWNoQqmckjnrPapUCvmSQgGho93nlolUvKn1EwiZfxIEkHbHAbA7A8K972z5xls3Nc8QsMVGDX7f9s30TsPUX1TayJZBXZr5/0XE6obvg7eD1YohyVRRV5ibO3ZUazzR2uRDbDR4A8ES6skHAyTqXYS4MofRIVm1KA0mgsBEV/1ObjF0pDP1r9IWF2suZBbU9DmZ3b0vFtC1qUdEFDU5BVyE6GYQuSqcbLO+zDx3XLueARxOauyamTCfzUPwf72kk3DFJsed8zgC1LV/PniGDuj6Aj7s3AnTQX5C9v0x8rDeZhq/oQ7Xy+0r1ZdJLyUc46ZazRyafO0+hX8j646zrBjm9zbp2721pkApxzFHnAheeFOTC7y6tMyiNsvNAA99jc7k9RNoMr9Al+8Qx4JsMKXmOp6TzNVA/hD+Rvw8MvkAmsl9xASqOcQQz8ne3cOOrL596MU2Ko0z4uKPrqY+jzxf7moL6CPVA0zQ1OqEi1kmwpBJFvyDvboBSc37wI05APax35loJyrDFxacybB2oymPJUyS/bCaceCpB+g143LDmrqBYQ1nwWz4op86jwz/qGKnScNey/u682b0ynzmoXzNYP74K0Dq3x57JujUBXDF93w7jBOuMB0h70HIUiawMtm3yilRwszvYfDET3qazoUDr30C8z
X-Forefront-PRVS: 029174C036
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39410400002)(39450400003)(39830400002)(39400400002)(377454003)(24454002)(86362001)(93516999)(63696999)(54356999)(50986999)(236005)(38730400002)(2950100002)(55446002)(76176999)(9686003)(229853002)(122856001)(66066001)(42186005)(93886004)(2906002)(110136004)(4326008)(59536001)(5660300001)(9896002)(512874002)(84326002)(6116002)(6862004)(3846002)(6246003)(53936002)(98316002)(81166006)(498394004)(53546009)(74482002)(189998001)(8676002)(54906002)(7736002)(8576002)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR11MB1674;
	H:mail-ua0-f173.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR11MB1674;
	23:ucLf0vn3Rz6Zmcrsw4rZMkLRy1pROvkRk2Ntw+Wg2?=
	=?us-ascii?Q?a9JoWOUYOWdIrvMfjNBkJkSEjU7Js6/bFeez2rMfwecYUMWhdcSHzo5aCAsi?=
	=?us-ascii?Q?VuWs0zyl7xqQmSUm2x0rl0roa+rYHoCAAL3VW+nVylkO21Bmh4mhL633+AxW?=
	=?us-ascii?Q?g+Iourz0fccWXDA9Go+LoGSZHuVpn7Q8MKM7dRmyw7klD0/D5jww+pdrGnnb?=
	=?us-ascii?Q?7rYWv6c6NuWZRQtNf0n2YMX5klN/0FUmjiKNLxaiF+ihJjpG5yZBUiGFglBC?=
	=?us-ascii?Q?oY5sO+uhUPn3xEDOAINJ6TJAVkaUtRpRAS0jSHx2V8IhZBMNGm6IuNtCAerY?=
	=?us-ascii?Q?47Kxp9WFwP4mGTzrVqhpZewcYOtCpqZMZ0fo41ayUAlzwU/F83iGyglOEx1m?=
	=?us-ascii?Q?Bq+FpInzEVS5Ov3vQLoe0nQynYRSL15DcdlXYIVPbaBdjeV8x6n8B7bEvDNx?=
	=?us-ascii?Q?JvnuiSF+UACrbvlPrEGOAHPDZTVZ28UNE2D+gnGRbHtveBIcckw3EK+UzMYt?=
	=?us-ascii?Q?RIx5uIUQ5ypC0PCL4b+oVnnujiNR05PzGMF3CbczlAtLurpCnYyfANxZHUCL?=
	=?us-ascii?Q?8gruuseMy0YkUiNBARatlvU6rzbq53LO05hRHd0YDtkBSHJKwmhiEebTgu2Z?=
	=?us-ascii?Q?rIILVToNNGKThV/JyJRZz/fTMBDaw7tVqeAWb9JIsrypmOdqDxB1pHzeBzdx?=
	=?us-ascii?Q?OcNpX85rA98RZajEBKG4jiYq8Kkm482KhGLUsNl4JXZIxmQRl209oJnznsog?=
	=?us-ascii?Q?nVlsheNO6hPrht9v82yoqkuSkDQzIYBMPGT8OOQb9mNSwE99HEihZMOO6Mqh?=
	=?us-ascii?Q?acVAcR2UogFlG/KD5g/UrQOHiuIglrRd2Mc1KvHKRvgFcEwp6cQk2wK/K+Bx?=
	=?us-ascii?Q?CxsJgFUENlKrECL/Jww9knY/7G380gMccuyML27eTUbGa+54mVHm2dKuDhq4?=
	=?us-ascii?Q?ZfVxOCw5aG04KZEWBbzf/NDJiiaL1ank+JWU4BH5VY20IB9uHTWKJlK5SnFC?=
	=?us-ascii?Q?QdZMvbJa8EVxdncFm94xzRIlyJWgNaPAw5wwyIHTodBanxlhNq81k6iPqTzi?=
	=?us-ascii?Q?grgD3EEDILpl/axky7fTdCqoob+pE+/ezC+5TnDzT/0uucWOqJNcYsx8sPyj?=
	=?us-ascii?Q?+yezN3hk641XSoKRKsKHKMnsNEPRC2YCBx6RIeKysyqrXYgTB7sHQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR11MB1674;
	6:dRLXkNbOYW2k+366kB3T/gEzAm66JQZ3ymrwtqsJaCaF6ghq39CTpgey4AVwkniGv7lHPYNhwxOuxHLCO5WqDV2BYVCURGMYtJL6VtlB1A0a9vjEZFC0XioWUAqHRA50ukIo4FjZXQXy6unVQnQ6uOLh6SKE/lSvIApQBq7AzI3n7hJnFA7+EnxWvaJdkyTRBZX/PWziQKp7/+o/r1HLQi6QZRHl/Kud08yb3rrH1R+U1cZSqAEemMqWlXZGrbGUhmZQUgp1Zz+FvZgXDxSVX6+Ff1dMPen10xMtLrTMTPbpZkulwOj5mVlao3GF80Z+Q4B2O3yoxuL+RibWL1q0FeSsXCcE+z77SDyKrUXmo3J7Zgk4xqfUy3gX1B1pMNEYdCrZwNK2bPaSJUPSntPMYeTJK429u/qRTJKHn0UYLcsKYBuSMgx95VYygySkCE9em3GOCmrzBDUd54r1HZr/cVUD27Y4N7eBb2TO7EEDMuUhR8dTIVsUUXTRD9dXebuHXuz0vQDxLHIQrw3QnWQcKQ==;
	5:BGSeeZ6K3SgdsWxhEgld7yTQtWPpPvpsndkmUhWagqls7pXBjqEBLgVRFKwTDoPebmtmAZVGdAyclDa71csE8yt1zWocI9Lxe9fMMfCttEtS4MTtNBwd4XDVbV9UNDP/XbVGeFyUpAxg2tVmI/woyQ==;
	24:ULJYNWi9Ma6WA6mcIAfYlhjHfkDiYmtP/4XsaJTbWd13ztNtN7wiiJm30nZmJ1TcP02MCw+SMW/J42EHxk1ia6NtGlFseMe0O8KIEPG819I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR11MB1674;
	7:0saDMGp7GQu3EwrqPPozQ4IAY/9CSHkxSNZdVvvBdHwwo8vOYKQUtlQHo+Z6GqY9PbuRdjxp4HcXQe4STqy3OzhzsxyoFWxL29FtCUVIrpo+NEA+5WQCAlqNvcTzRKHO4KzpJDn76ffcrtFMflo++CP7pbwFuqZu+0ETdLwkwh0Y6qMps1iVAmPW/EJTsS9hQtnrZ+r3Z1Wln0Q2U/uH/swBflEQ9XesG6lemKh+67nbcbSGNSf6CN1pPdlhM1WVAOyufWLRUZB+ybWcS9OMbHbQ+pzACYikULO4m44QO5VGi5yXp0NN+aOnWnczCPPXhiNGGFLGSJXQp7LWEZFnZw==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2017 18:01:22.2619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1674
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Fri, 28 Apr 2017 18:01:23 -0000
Content-Type: multipart/alternative; boundary="001a113d1b983eb82d054e3ddc1c"

--001a113d1b983eb82d054e3ddc1c
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 28, 2017 at 12:30 PM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 28 April 2017 at 14:58, Burton, Ross <ross.burton@intel.com> wrote:
>
>> dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect the RRS doesn't use
>> the same algorithm.  Not sure what opkg and dpkg think of it.
>>
>
> I meant opkg and rpm, obviously.
>
> Good news is that RPM says 1.2rc2 < 1.2.0 too.
>


Looks good with opkg:

$ opkg compare-versions '1.2rc2' '<<' '1.2.0'; echo $?
0

Tested with opkg HEAD revision. I also tested with 0.3.0 but it seems the
'compare-versions' command was broken...

Marc

--001a113d1b983eb82d054e3ddc1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Apr 28, 2017 at 12:30 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_extra"><span><br><div class=3D"gmail_quote=
">On 28 April 2017 at 14:58, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
class=3D"gmail_extra">dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect=
 the RRS doesn&#39;t use the same algorithm.=C2=A0 Not sure what opkg and d=
pkg think of it.</div></blockquote></div><br></span>I meant opkg and rpm, o=
bviously.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Good news is that RPM says 1.2rc2 &lt; 1.2.0 too.</div></div></blockquo=
te><div><br><br><div>Looks good with opkg:<br><br>$ opkg compare-versions &=
#39;1.2rc2&#39; &#39;&lt;&lt;&#39; &#39;1.2.0&#39;; echo $?<br>0<br><br></d=
iv>Tested with opkg HEAD revision. I also tested with 0.3.0 but it seems th=
e &#39;compare-versions&#39; command was broken...<br><br></div><div>Marc<b=
r></div></div></div></div>

--001a113d1b983eb82d054e3ddc1c--
