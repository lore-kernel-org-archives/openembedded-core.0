Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85FEC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 17:37:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.33454.1655746646452908428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 10:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8wIejGg;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id i15so10351068plr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=2nW4sAKVFE3uqPJOyUlY17ko2gD2vD82L7p/vbpxOqA=;
        b=V8wIejGgExA8a85RzzAi94qx63F4HZDpV8NU3Re2bqSHb+l4Qt8e+Eh567Ee7Fd5OZ
         56qnyo6EvQmPDXttDOllapo18BiP/HWC/UboQT1S+mtciv5KMkt4FR8Vm/P1zWhzevfc
         /RRCCIGcPuopTct/CorbPSrKVNDkf7tsRrRYc/MDqM6Fv0HbQJP8yC5cnIjwgD4gBv0c
         p+DmvCk//NWBi5ESISeoMMvUsa5aTcEZ9TcLgjY84zDXmzc3cmsswQFy7JQE4931XHWt
         uMLtxZl/oS1CoeDCxWNA3NXpuVKSPgoX0+Jc7BcDMm57xbgYuycozv8Q/7MX1UiK8vr2
         CZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2nW4sAKVFE3uqPJOyUlY17ko2gD2vD82L7p/vbpxOqA=;
        b=MoZd+tCOuSDLHmh3YLwmk9BZUuEYQlv5tYBD2V2SZbOK0L47TY0XdXyzNObBZvBrln
         5N5BwpzuW/d/uDgXS9wlxqW/uxXr7BEDg3ofojQl600lxu+Io4FUR/Gkwvwu6AhP8Q8d
         3jsg2YS9HoFmpelFjnYc/xarwQfWFf2ftV7Zv3C3lCAJ8a+IIGNr9Mm3b5bInxzEKvnX
         MULJyzN2a1+bi45wI46AxvWpsOgS4vv7gU97cyH766wLTKjQFeJcl6Uf26iP8Sq5TCYj
         3HkRdZ7JtTwxwFOukNks5KhLczNrniiCoK7guLsdyPco5UDYFneS91K9lQYL885cqZzA
         ggeg==
X-Gm-Message-State: AJIora9d+YKdQ/UIEA4AZuEKS5wOjn9FFzKH1UnL6LnPYvWcdiTM64f0
	Y048BeuXJxZeCTVOohMRyQ8=
X-Google-Smtp-Source: 
 AGRyM1so3ToHggvrEUHWcEGsrworPSwFTenPo+2zR9KfPja80raYWiI5l6BeIBkWI22ohzl0LZ6F1Q==
X-Received: by 2002:a17:90a:c981:b0:1e6:75f0:d4ea with SMTP id
 w1-20020a17090ac98100b001e675f0d4eamr39191121pjt.37.1655746645759;
        Mon, 20 Jun 2022 10:37:25 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:7c8a:82c3:c70:4983?
 ([2601:202:4180:a5c0:7c8a:82c3:c70:4983])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a056a00212e00b005184d1e838dsm9856446pfj.12.2022.06.20.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:37:20 -0700 (PDT)
Message-ID: <144c5532-b026-c461-d63d-2d092376400b@gmail.com>
Date: Mon, 20 Jun 2022 10:37:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [dunfell][PATCH] openldap: CVE-2022-29155 OpenLDAP SQL
 injection
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-core@lists.openembedded.org
References: <20220620052143.7857-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220620052143.7857-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 17:37:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167124

This should be sent to openembedded-devel@lists.openembedded.org

it applies against meta-openembedded, not core.

-armin

On 6/19/22 22:21, Hitendra Prajapati wrote:
> Source: https://git.openldap.org/openldap/openldap
> MR: 117821
> Type: Security Fix
> Disposition: Backport from https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134
> ChangeID: d534808c796600ca5994bcda28938d45405bc7b4
> Description:
> 	CVE-2022-29155 openldap: OpenLDAP SQL injection
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../openldap/openldap/CVE-2022-29155.patch    | 277 ++++++++++++++++++
>   .../openldap/openldap_2.4.57.bb               |   2 +-
>   2 files changed, 278 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
> new file mode 100644
> index 000000000..2860b9522
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
> @@ -0,0 +1,277 @@
> +From 11e136f15085a4bda5701e910988966bed699977 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Wed, 18 May 2022 13:57:59 +0530
> +Subject: [PATCH] CVE-2022-29155
> +
> +Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134]
> +CVE: CVE-2022-29155
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +
> +---
> + servers/slapd/back-sql/search.c | 123 +++++++++++++++++++++++++++-----
> + 1 file changed, 105 insertions(+), 18 deletions(-)
> +
> +diff --git a/servers/slapd/back-sql/search.c b/servers/slapd/back-sql/search.c
> +index bb0f1e2..1770bde 100644
> +--- a/servers/slapd/back-sql/search.c
> ++++ b/servers/slapd/back-sql/search.c
> +@@ -63,6 +63,38 @@ static void send_paged_response(
> + 	ID  *lastid );
> + #endif /* ! BACKSQL_ARBITRARY_KEY */
> +
> ++/* Look for chars that need to be escaped, return count of them.
> ++ * If out is non-NULL, copy escape'd val to it.
> ++ */
> ++static int
> ++backsql_val_escape( Operation *op, struct berval *in, struct berval *out )
> ++{
> ++	char *ptr, *end;
> ++	int q = 0;
> ++
> ++	ptr = in->bv_val;
> ++	end = ptr + in->bv_len;
> ++	while (ptr < end) {
> ++		if ( *ptr == '\'' )
> ++			q++;
> ++		ptr++;
> ++	}
> ++	if ( q && out ) {
> ++		char *dst;
> ++		out->bv_len = in->bv_len + q;
> ++		out->bv_val = op->o_tmpalloc( out->bv_len + 1, op->o_tmpmemctx );
> ++		ptr = in->bv_val;
> ++		dst = out->bv_val;
> ++		while (ptr < end ) {
> ++			if ( *ptr == '\'' )
> ++				*dst++ = '\'';
> ++			*dst++ = *ptr++;
> ++		}
> ++		*dst = '\0';
> ++	}
> ++	return q;
> ++}
> ++
> + static int
> + backsql_attrlist_add( backsql_srch_info *bsi, AttributeDescription *ad )
> + {
> +@@ -429,6 +461,8 @@ backsql_process_sub_filter( backsql_srch_info *bsi, Filter *f,
> + 	backsql_info		*bi = (backsql_info *)bsi->bsi_op->o_bd->be_private;
> + 	int			i;
> + 	int			casefold = 0;
> ++	int			escaped = 0;
> ++	struct berval	escval, *fvalue;
> +
> + 	if ( !f ) {
> + 		return 0;
> +@@ -462,50 +496,68 @@ backsql_process_sub_filter( backsql_srch_info *bsi, Filter *f,
> +
> + 		BER_BVZERO( &bv );
> + 		if ( f->f_sub_initial.bv_val ) {
> +-			bv.bv_len += f->f_sub_initial.bv_len;
> ++			bv.bv_len += f->f_sub_initial.bv_len + backsql_val_escape( NULL, &f->f_sub_initial, NULL );
> + 		}
> + 		if ( f->f_sub_any != NULL ) {
> + 			for ( a = 0; f->f_sub_any[ a ].bv_val != NULL; a++ ) {
> +-				bv.bv_len += f->f_sub_any[ a ].bv_len;
> ++				bv.bv_len += f->f_sub_any[ a ].bv_len + backsql_val_escape( NULL, &f->f_sub_any[ a ], NULL );
> + 			}
> + 		}
> + 		if ( f->f_sub_final.bv_val ) {
> +-			bv.bv_len += f->f_sub_final.bv_len;
> ++			bv.bv_len += f->f_sub_final.bv_len + backsql_val_escape( NULL, &f->f_sub_final, NULL );
> + 		}
> + 		bv.bv_len = 2 * bv.bv_len - 1;
> + 		bv.bv_val = ch_malloc( bv.bv_len + 1 );
> +
> + 		s = 0;
> + 		if ( !BER_BVISNULL( &f->f_sub_initial ) ) {
> +-			bv.bv_val[ s ] = f->f_sub_initial.bv_val[ 0 ];
> +-			for ( i = 1; i < f->f_sub_initial.bv_len; i++ ) {
> ++			fvalue = &f->f_sub_initial;
> ++			escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++			if ( escaped )
> ++				fvalue = &escval;
> ++			bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
> ++			for ( i = 1; i < fvalue->bv_len; i++ ) {
> + 				bv.bv_val[ s + 2 * i - 1 ] = '%';
> +-				bv.bv_val[ s + 2 * i ] = f->f_sub_initial.bv_val[ i ];
> ++				bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
> + 			}
> + 			bv.bv_val[ s + 2 * i - 1 ] = '%';
> + 			s += 2 * i;
> ++			if ( escaped )
> ++				bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> + 		}
> +
> + 		if ( f->f_sub_any != NULL ) {
> + 			for ( a = 0; !BER_BVISNULL( &f->f_sub_any[ a ] ); a++ ) {
> +-				bv.bv_val[ s ] = f->f_sub_any[ a ].bv_val[ 0 ];
> +-				for ( i = 1; i < f->f_sub_any[ a ].bv_len; i++ ) {
> ++				fvalue = &f->f_sub_any[ a ];
> ++				escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++				if ( escaped )
> ++					fvalue = &escval;
> ++				bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
> ++				for ( i = 1; i < fvalue->bv_len; i++ ) {
> + 					bv.bv_val[ s + 2 * i - 1 ] = '%';
> +-					bv.bv_val[ s + 2 * i ] = f->f_sub_any[ a ].bv_val[ i ];
> ++					bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
> + 				}
> + 				bv.bv_val[ s + 2 * i - 1 ] = '%';
> + 				s += 2 * i;
> ++				if ( escaped )
> ++					bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> + 			}
> + 		}
> +
> + 		if ( !BER_BVISNULL( &f->f_sub_final ) ) {
> +-			bv.bv_val[ s ] = f->f_sub_final.bv_val[ 0 ];
> +-			for ( i = 1; i < f->f_sub_final.bv_len; i++ ) {
> ++			fvalue = &f->f_sub_final;
> ++			escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++			if ( escaped )
> ++				fvalue = &escval;
> ++			bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
> ++			for ( i = 1; i < fvalue->bv_len; i++ ) {
> + 				bv.bv_val[ s + 2 * i - 1 ] = '%';
> +-				bv.bv_val[ s + 2 * i ] = f->f_sub_final.bv_val[ i ];
> ++				bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
> + 			}
> +-				bv.bv_val[ s + 2 * i - 1 ] = '%';
> ++			bv.bv_val[ s + 2 * i - 1 ] = '%';
> + 			s += 2 * i;
> ++			if ( escaped )
> ++				bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> + 		}
> +
> + 		bv.bv_val[ s - 1 ] = '\0';
> +@@ -561,11 +613,17 @@ backsql_process_sub_filter( backsql_srch_info *bsi, Filter *f,
> + 			f->f_sub_initial.bv_val, 0 );
> + #endif /* BACKSQL_TRACE */
> +
> ++		fvalue = &f->f_sub_initial;
> ++		escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++		if ( escaped )
> ++			fvalue = &escval;
> + 		start = bsi->bsi_flt_where.bb_val.bv_len;
> + 		backsql_strfcat_x( &bsi->bsi_flt_where,
> + 				bsi->bsi_op->o_tmpmemctx,
> + 				"b",
> +-				&f->f_sub_initial );
> ++				fvalue );
> ++		if ( escaped )
> ++			bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> + 		if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
> + 			ldap_pvt_str2upper( &bsi->bsi_flt_where.bb_val.bv_val[ start ] );
> + 		}
> +@@ -586,12 +644,18 @@ backsql_process_sub_filter( backsql_srch_info *bsi, Filter *f,
> + 				i, f->f_sub_any[ i ].bv_val );
> + #endif /* BACKSQL_TRACE */
> +
> ++			fvalue = &f->f_sub_any[ i ];
> ++			escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++			if ( escaped )
> ++				fvalue = &escval;
> + 			start = bsi->bsi_flt_where.bb_val.bv_len;
> + 			backsql_strfcat_x( &bsi->bsi_flt_where,
> + 					bsi->bsi_op->o_tmpmemctx,
> + 					"bc",
> +-					&f->f_sub_any[ i ],
> ++					fvalue,
> + 					'%' );
> ++			if ( escaped )
> ++				bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> + 			if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
> + 				/*
> + 				 * Note: toupper('%') = '%'
> +@@ -611,11 +675,17 @@ backsql_process_sub_filter( backsql_srch_info *bsi, Filter *f,
> + 			f->f_sub_final.bv_val, 0 );
> + #endif /* BACKSQL_TRACE */
> +
> ++		fvalue = &f->f_sub_final;
> ++		escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
> ++		if ( escaped )
> ++			fvalue = &escval;
> + 		start = bsi->bsi_flt_where.bb_val.bv_len;
> +     		backsql_strfcat_x( &bsi->bsi_flt_where,
> + 				bsi->bsi_op->o_tmpmemctx,
> + 				"b",
> +-				&f->f_sub_final );
> ++				fvalue );
> ++		if ( escaped )
> ++			bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> +   		if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
> + 			ldap_pvt_str2upper( &bsi->bsi_flt_where.bb_val.bv_val[ start ] );
> + 		}
> +@@ -1183,6 +1253,8 @@ backsql_process_filter_attr( backsql_srch_info *bsi, Filter *f, backsql_at_map_r
> + 	struct berval		*filter_value = NULL;
> + 	MatchingRule		*matching_rule = NULL;
> + 	struct berval		ordering = BER_BVC("<=");
> ++	struct berval		escval;
> ++	int					escaped = 0;
> +
> + 	Debug( LDAP_DEBUG_TRACE, "==>backsql_process_filter_attr(%s)\n",
> + 		at->bam_ad->ad_cname.bv_val, 0, 0 );
> +@@ -1237,6 +1309,10 @@ equality_match:;
> + 			casefold = 1;
> + 		}
> +
> ++		escaped = backsql_val_escape( bsi->bsi_op, filter_value, &escval );
> ++		if ( escaped )
> ++			filter_value = &escval;
> ++
> + 		/* FIXME: directoryString filtering should use a similar
> + 		 * approach to deal with non-prettified values like
> + 		 * " A  non    prettified   value  ", by using a LIKE
> +@@ -1317,6 +1393,10 @@ equality_match:;
> + 			casefold = 1;
> + 		}
> +
> ++		escaped = backsql_val_escape( bsi->bsi_op, filter_value, &escval );
> ++		if ( escaped )
> ++			filter_value = &escval;
> ++
> + 		/*
> + 		 * FIXME: should we uppercase the operands?
> + 		 */
> +@@ -1350,7 +1430,7 @@ equality_match:;
> + 					&at->bam_sel_expr,
> + 					&ordering,
> + 					'\'',
> +-					&f->f_av_value,
> ++					filter_value,
> + 					(ber_len_t)STRLENOF( /* (' */ "')" ),
> + 						/* ( */ "')" );
> + 		}
> +@@ -1374,13 +1454,17 @@ equality_match:;
> + 	case LDAP_FILTER_APPROX:
> + 		/* we do our best */
> +
> ++		filter_value = &f->f_av_value;
> ++		escaped = backsql_val_escape( bsi->bsi_op, filter_value, &escval );
> ++		if ( escaped )
> ++			filter_value = &escval;
> + 		/*
> + 		 * maybe we should check type of at->sel_expr here somehow,
> + 		 * to know whether upper_func is applicable, but for now
> + 		 * upper_func stuff is made for Oracle, where UPPER is
> + 		 * safely applicable to NUMBER etc.
> + 		 */
> +-		(void)backsql_process_filter_like( bsi, at, 1, &f->f_av_value );
> ++		(void)backsql_process_filter_like( bsi, at, 1, filter_value );
> + 		break;
> +
> + 	default:
> +@@ -1394,6 +1478,9 @@ equality_match:;
> +
> + 	}
> +
> ++	if ( escaped )
> ++		bsi->bsi_op->o_tmpfree( escval.bv_val, bsi->bsi_op->o_tmpmemctx );
> ++
> + 	Debug( LDAP_DEBUG_TRACE, "<==backsql_process_filter_attr(%s)\n",
> + 		at->bam_ad->ad_cname.bv_val, 0, 0 );
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> index a282523a3..e3e9caa1b 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> @@ -23,8 +23,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>       file://thread_stub.patch \
>       file://openldap-CVE-2015-3276.patch \
>       file://remove-user-host-pwd-from-version.patch \
> +    file://CVE-2022-29155.patch \
>   "
> -
>   SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
>   SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167083): https://lists.openembedded.org/g/openembedded-core/message/167083
> Mute This Topic: https://lists.openembedded.org/mt/91871436/3616698
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


