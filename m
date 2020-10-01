Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2061.1601580184930450013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 12:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jN6qTszF;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id g4so6873947edk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztecdxjuWdN1CGHIAHR3UJ2JuQSAvWcPvI6PvaxarzY=;
        b=jN6qTszFoq0q9T/LV7fUraXOZ5VTSPmtPSRfd2nlErNRAnT8LF+5T3V9fhgWrjao+J
         55aFUIN8RCDIC3/TKcMUgryQn3fypLZdCuRMjRBGZ1yOUT7lbpMJavoRYPKatbAEj/Yr
         67GF7eh9a71lTuT3FGpjdskBgd5pKA31kHBtvr+ZCo7xRI+xH1ILgBLKXfYAA9/ApiLa
         SthxR05NUiVgJ+jdRkOhJWGqMf7Pz8COgTd+VCtOoVh0mJBnxhgOG9so6iUKQQWyK57g
         l55jRWrudFng1uQMngV4I6dNvyw6q8Mpz7e3XAmotY2ZzpH9FzUR2fHEgyf8k2UVc0Yn
         Pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztecdxjuWdN1CGHIAHR3UJ2JuQSAvWcPvI6PvaxarzY=;
        b=kI83iiX3jxejci4YnzkKblmo06MIjVFyF64yO5XLlqBLSFV/9mJ2tIxcRh8FE4iOPB
         YcsGOlqyiLvhMCgrL7lK1NpK+U0AhTLb6xVwkVoK1ZsNpO0VbU3CINiX83SIHmf2Jsnw
         Uw/+S94Ck3LIU1Wi3pbsYo9g6RoF2J/XfQn+q6ksgSMQuLoJppBEYSXOU+qeCOWcjKNT
         SmCpy0nBUmDOO7Eu7Pa/BT55dJPQZN+dlaaRQuIayg95IBm3Io9jV2prc7XaoqqmHHHt
         CHE3iQg4zLa5d/iBzcpRXM6aHhgxF8oiv7h8sN4fMlmXal/w5todI1lPmZhVNYbSmM+B
         kxKQ==
X-Gm-Message-State: AOAM531wBSZ6uOorlnXIRTtAvGN1iNpWI5E6+pVQ/9pW9EbFeKpy6l4q
	7OptDePyyQBcOYgwF8zXyyRMhOwqZH3TqIXTReK0Nw==
X-Google-Smtp-Source: ABdhPJwy0W0Ul4YD1PEM+No/w0f2fkYJJgWjokF921ParQFkVJ+tkbq8XxG519EEcai424+MjvtX/MKbTlFlS3M3GMs=
X-Received: by 2002:a50:950e:: with SMTP id u14mr9178184eda.260.1601580183194;
 Thu, 01 Oct 2020 12:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200818140637.64777-1-chee.yang.lee@intel.com> <20200818140637.64777-2-chee.yang.lee@intel.com>
In-Reply-To: <20200818140637.64777-2-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 1 Oct 2020 09:22:50 -1000
Message-ID: <CAOSpxdZyabWQWg_zz9FabnoowMK0o3WdjzWX=Q-L+B9PxQkwSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell 2/2] perl: fix CVE-2020-12723
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6470b05b0a0f14e"

--000000000000e6470b05b0a0f14e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch results in the t/re/pat.t ptest failing.

Is this a real issue?

Steve

On Tue, Aug 18, 2020, 4:06 AM Lee Chee Yang <chee.yang.lee@intel.com> wrot=
e:

> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Minor changes to the test cases count in the .patch file to make it
> align with current version, so the fixes can be apply.
> Changes apply to line:
>
> https://github.com/perl/perl5/commit/66bbb51b93253a3f87d11c2695cfb7bdb78=
2184a#diff-e31ddd69cf47acf02911647c691a0283L28
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../perl/files/CVE-2020-12723.patch           | 302 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.30.1.bb     |   1 +
>  2 files changed, 303 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-12723.patc=
h
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> new file mode 100644
> index 0000000000..ad195cffab
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> @@ -0,0 +1,302 @@
> +From da9ec461e22915ccabb06785bf39ec34577ada12 Mon Sep 17 00:00:00 2001
> +From: Hugo van der Sanden <hv@crypt.org>
> +Date: Sat, 11 Apr 2020 14:10:24 +0100
> +Subject: [PATCH] study_chunk: avoid mutating regexp program within GOSU=
B
> +
> +gh16947 and gh17743: studying GOSUB may restudy in an inner call
> +(via a mix of recursion and enframing) something that an outer call
> +is in the middle of looking at.  Let the outer frame deal with it.
> +
> +(CVE-2020-12723)
> +
> +(cherry picked from commit c4033e740bd18d9fbe3456a9db2ec2053cdc5271)
> +
> +Upstream-Status: Backport [
> https://github.com/perl/perl5/commit/66bbb51b93253a3f87d11c2695cfb7bdb78=
2184a
> ]
> +CVE: CVE-2020-12723
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + embed.fnc  |  2 +-
> + embed.h    |  2 +-
> + proto.h    |  2 +-
> + regcomp.c  | 54 +++++++++++++++++++++++++++++++++++-------------------
> + t/re/pat.t | 26 +++++++++++++++++++++++++-
> + 5 files changed, 63 insertions(+), 23 deletions(-)
> +
> +diff --git a/embed.fnc b/embed.fnc
> +index f45c127..eff4a50 100644
> +--- a/embed.fnc
> ++++ b/embed.fnc
> +@@ -2480,7 +2480,7 @@ Es       |SSize_t|study_chunk    |NN RExC_state_t
> *pRExC_state \
> +                               |NULLOK struct scan_data_t *data \
> +                                 |I32 stopparen|U32 recursed_depth \
> +                               |NULLOK regnode_ssc *and_withp \
> +-                              |U32 flags|U32 depth
> ++                              |U32 flags|U32 depth|bool was_mutate_ok
> + Es    |void   |rck_elide_nothing|NN regnode *node
> + EsR   |SV *   |get_ANYOFM_contents|NN const regnode * n
> + EsRn  |U32    |add_data       |NN RExC_state_t* const pRExC_state \
> +diff --git a/embed.h b/embed.h
> +index 356a8b9..5346ec5 100644
> +--- a/embed.h
> ++++ b/embed.h
> +@@ -1239,7 +1239,7 @@
> + #define ssc_is_cp_posixl_init S_ssc_is_cp_posixl_init
> + #define ssc_or(a,b,c)         S_ssc_or(aTHX_ a,b,c)
> + #define ssc_union(a,b,c)      S_ssc_union(aTHX_ a,b,c)
> +-#define study_chunk(a,b,c,d,e,f,g,h,i,j,k)    S_study_chunk(aTHX_
> a,b,c,d,e,f,g,h,i,j,k)
> ++#define study_chunk(a,b,c,d,e,f,g,h,i,j,k,l)  S_study_chunk(aTHX_
> a,b,c,d,e,f,g,h,i,j,k,l)
> + #  endif
> + #  if defined(PERL_IN_REGCOMP_C) || defined (PERL_IN_DUMP_C)
> + #define _invlist_dump(a,b,c,d)        Perl__invlist_dump(aTHX_ a,b,c,d=
)
> +diff --git a/proto.h b/proto.h
> +index 91530b1..1bda01f 100644
> +--- a/proto.h
> ++++ b/proto.h
> +@@ -5655,7 +5655,7 @@ PERL_STATIC_INLINE void  S_ssc_union(pTHX_
> regnode_ssc *ssc, SV* const invlist, c
> + #define PERL_ARGS_ASSERT_SSC_UNION    \
> +       assert(ssc); assert(invlist)
> + #endif
> +-STATIC SSize_t        S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp, SSize_t *minlenp, SSize_t *deltap, regnode *last, struc=
t
> scan_data_t *data, I32 stopparen, U32 recursed_depth, regnode_ssc
> *and_withp, U32 flags, U32 depth);
> ++STATIC SSize_t        S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp, SSize_t *minlenp, SSize_t *deltap, regnode *last, struc=
t
> scan_data_t *data, I32 stopparen, U32 recursed_depth, regnode_ssc
> *and_withp, U32 flags, U32 depth, bool was_mutate_ok);
> + #define PERL_ARGS_ASSERT_STUDY_CHUNK  \
> +       assert(pRExC_state); assert(scanp); assert(minlenp);
> assert(deltap); assert(last)
> + #endif
> +diff --git a/regcomp.c b/regcomp.c
> +index 5a9adee..8d7df1f 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -106,6 +106,7 @@ typedef struct scan_frame {
> +     regnode *next_regnode;      /* next node to process when last is
> reached */
> +     U32 prev_recursed_depth;
> +     I32 stopparen;              /* what stopparen do we use */
> ++    bool in_gosub;              /* this or an outer frame is for GOSUB=
 */
> +
> +     struct scan_frame *this_prev_frame; /* this previous frame */
> +     struct scan_frame *prev_frame;      /* previous frame */
> +@@ -4466,7 +4467,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                       I32 stopparen,
> +                         U32 recursed_depth,
> +                       regnode_ssc *and_withp,
> +-                      U32 flags, U32 depth)
> ++                      U32 flags, U32 depth, bool was_mutate_ok)
> +                       /* scanp: Start here (read-write). */
> +                       /* deltap: Write maxlen-minlen here. */
> +                       /* last: Stop before this one. */
> +@@ -4545,6 +4546,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                                    node length to get a real minimum
> (because
> +                                    the folded version may be shorter) =
*/
> +       bool unfolded_multi_char =3D FALSE;
> ++        /* avoid mutating ops if we are anywhere within the recursed o=
r
> ++         * enframed handling for a GOSUB: the outermost level will
> handle it.
> ++         */
> ++        bool mutate_ok =3D was_mutate_ok && !(frame && frame->in_gosub=
);
> +       /* Peephole optimizer: */
> +         DEBUG_STUDYDATA("Peep", data, depth, is_inf);
> +         DEBUG_PEEP("Peep", scan, depth, flags);
> +@@ -4555,7 +4560,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +          * parsing code, as each (?:..) is handled by a different
> invocation of
> +          * reg() -- Yves
> +          */
> +-        JOIN_EXACT(scan,&min_subtract, &unfolded_multi_char, 0);
> ++        if (mutate_ok)
> ++            JOIN_EXACT(scan,&min_subtract, &unfolded_multi_char, 0);
> +
> +         /* Follow the next-chain of the current node and optimize
> +            away all the NOTHINGs from it.
> +@@ -4587,7 +4593,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +             /* DEFINEP study_chunk() recursion */
> +             (void)study_chunk(pRExC_state, &scan, &minlen,
> +                               &deltanext, next, &data_fake, stopparen,
> +-                              recursed_depth, NULL, f, depth+1);
> ++                              recursed_depth, NULL, f, depth+1,
> mutate_ok);
> +
> +             scan =3D next;
> +         } else
> +@@ -4655,7 +4661,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                     /* recurse study_chunk() for each BRANCH in an
> alternation */
> +                   minnext =3D study_chunk(pRExC_state, &scan, minlenp,
> +                                       &deltanext, next, &data_fake,
> stopparen,
> +-                                      recursed_depth, NULL, f, depth+1=
);
> ++                                      recursed_depth, NULL, f, depth+1=
,
> ++                                      mutate_ok);
> +
> +                   if (min1 > minnext)
> +                       min1 =3D minnext;
> +@@ -4722,9 +4729,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                   }
> +               }
> +
> +-                if (PERL_ENABLE_TRIE_OPTIMISATION &&
> +-                        OP( startbranch ) =3D=3D BRANCH )
> +-                {
> ++                if (PERL_ENABLE_TRIE_OPTIMISATION
> ++                    && OP(startbranch) =3D=3D BRANCH
> ++                    && mutate_ok
> ++                ) {
> +               /* demq.
> +
> +                    Assuming this was/is a branch we are dealing with:
> 'scan'
> +@@ -5179,6 +5187,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                 newframe->stopparen =3D stopparen;
> +                 newframe->prev_recursed_depth =3D recursed_depth;
> +                 newframe->this_prev_frame=3D frame;
> ++                newframe->in_gosub =3D (
> ++                    (frame && frame->in_gosub) || OP(scan) =3D=3D GOSU=
B
> ++                );
> +
> +                 DEBUG_STUDYDATA("frame-new", data, depth, is_inf);
> +                 DEBUG_PEEP("fnew", scan, depth, flags);
> +@@ -5336,7 +5347,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +
> +                 /* This temporary node can now be turned into EXACTFU,
> and
> +                  * must, as regexec.c doesn't handle it */
> +-                if (OP(next) =3D=3D EXACTFU_S_EDGE) {
> ++                if (OP(next) =3D=3D EXACTFU_S_EDGE && mutate_ok) {
> +                     OP(next) =3D EXACTFU;
> +                 }
> +
> +@@ -5344,8 +5355,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                     &&   isALPHA_A(* STRING(next))
> +                     && (         OP(next) =3D=3D EXACTFAA
> +                         || (     OP(next) =3D=3D EXACTFU
> +-                            && ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE(*
> STRING(next)))))
> +-                {
> ++                            && ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE(*
> STRING(next))))
> ++                    &&   mutate_ok
> ++                ) {
> +                     /* These differ in just one bit */
> +                     U8 mask =3D ~ ('A' ^ 'a');
> +
> +@@ -5432,7 +5444,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                                   (mincount =3D=3D 0
> +                                    ? (f & ~SCF_DO_SUBSTR)
> +                                    : f)
> +-                                  ,depth+1);
> ++                                  , depth+1, mutate_ok);
> +
> +               if (flags & SCF_DO_STCLASS)
> +                   data->start_class =3D oclass;
> +@@ -5498,7 +5510,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +               if (  OP(oscan) =3D=3D CURLYX && data
> +                     && data->flags & SF_IN_PAR
> +                     && !(data->flags & SF_HAS_EVAL)
> +-                    && !deltanext && minnext =3D=3D 1 ) {
> ++                    && !deltanext && minnext =3D=3D 1
> ++                      && mutate_ok
> ++                ) {
> +                   /* Try to optimize to CURLYN.  */
> +                   regnode *nxt =3D NEXTOPER(oscan) + EXTRA_STEP_2ARGS;
> +                   regnode * const nxt1 =3D nxt;
> +@@ -5548,10 +5562,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                     && !(data->flags & SF_HAS_EVAL)
> +                     && !deltanext     /* atom is fixed width */
> +                     && minnext !=3D 0   /* CURLYM can't handle zero wi=
dth
> */
> +-
> +                          /* Nor characters whose fold at run-time may =
be
> +                           * multi-character */
> +                       && ! (RExC_seen & REG_UNFOLDED_MULTI_SEEN)
> ++                      && mutate_ok
> +               ) {
> +                   /* XXXX How to optimize if data =3D=3D 0? */
> +                   /* Optimize to a simpler form.  */
> +@@ -5604,7 +5618,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state,
> regnode **scanp,
> +                         /* recurse study_chunk() on optimised CURLYX =
=3D>
> CURLYM */
> +                       study_chunk(pRExC_state, &nxt1, minlenp,
> &deltanext, nxt,
> +                                     NULL, stopparen, recursed_depth,
> NULL, 0,
> +-                                    depth+1);
> ++                                    depth+1, mutate_ok);
> +                   }
> +                   else
> +                       oscan->flags =3D 0;
> +@@ -6009,7 +6023,8 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" =
UVuf
> "\n",
> +                 /* recurse study_chunk() for lookahead body */
> +                 minnext =3D study_chunk(pRExC_state, &nscan, minlenp,
> &deltanext,
> +                                       last, &data_fake, stopparen,
> +-                                      recursed_depth, NULL, f, depth+1=
);
> ++                                      recursed_depth, NULL, f, depth+1=
,
> ++                                      mutate_ok);
> +                 if (scan->flags) {
> +                     if (   deltanext < 0
> +                         || deltanext > (I32) U8_MAX
> +@@ -6114,7 +6129,7 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" =
UVuf
> "\n",
> +                 *minnextp =3D study_chunk(pRExC_state, &nscan, minnext=
p,
> +                                         &deltanext, last, &data_fake,
> +                                         stopparen, recursed_depth, NUL=
L,
> +-                                        f, depth+1);
> ++                                        f, depth+1, mutate_ok);
> +                 if (scan->flags) {
> +                     assert(0);  /* This code has never been tested sin=
ce
> this
> +                                    is normally not compiled */
> +@@ -6282,7 +6297,8 @@ Perl_re_printf( aTHX_  "LHS=3D%" UVuf " RHS=3D%" =
UVuf
> "\n",
> +                         /* optimise study_chunk() for TRIE */
> +                         minnext =3D study_chunk(pRExC_state, &scan,
> minlenp,
> +                             &deltanext, (regnode *)nextbranch,
> &data_fake,
> +-                            stopparen, recursed_depth, NULL, f, depth+=
1);
> ++                            stopparen, recursed_depth, NULL, f, depth+=
1,
> ++                            mutate_ok);
> +                     }
> +                     if (nextbranch && PL_regkind[OP(nextbranch)]=3D=3D=
BRANCH)
> +                         nextbranch=3D regnext((regnode*)nextbranch);
> +@@ -8075,7 +8091,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, in=
t
> pat_count,
> +             &data, -1, 0, NULL,
> +             SCF_DO_SUBSTR | SCF_WHILEM_VISITED_POS | stclass_flag
> +                           | (restudied ? SCF_TRIE_DOING_RESTUDY : 0),
> +-            0);
> ++            0, TRUE);
> +
> +
> +         CHECK_RESTUDY_GOTO_butfirst(LEAVE_with_name("study_chunk"));
> +@@ -8204,7 +8220,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, in=
t
> pat_count,
> +             SCF_DO_STCLASS_AND|SCF_WHILEM_VISITED_POS|(restudied
> +                                                       ?
> SCF_TRIE_DOING_RESTUDY
> +                                                       : 0),
> +-            0);
> ++            0, TRUE);
> +
> +         CHECK_RESTUDY_GOTO_butfirst(NOOP);
> +
> +diff --git a/t/re/pat.t b/t/re/pat.t
> +index 6a868f4..2869b58 100644
> +--- a/t/re/pat.t
> ++++ b/t/re/pat.t
> +@@ -25,7 +25,7 @@ BEGIN {
> + skip_all('no re module') unless defined &DynaLoader::boot_DynaLoader;
> + skip_all_without_unicode_tables();
> +
> +-plan tests =3D> 864;  # Update this when adding/deleting tests.
> ++plan tests =3D> 873;  # Update this when adding/deleting tests.
> +
> + run_tests() unless caller;
> +
> +@@ -2115,6 +2115,30 @@ x{0c!}\;\;=C3=AE=C3=A7=C3=BF   /0f/! F   /;=C3=
=AE=C3=A7=C3=BF=C3=B9\Q    x =C3=BF=C3=BF=C3=BF=C3=BF   =C3=B9
>   `x{0c!} ;   =C3=B9\Q
> +         like(runperl(prog =3D> "$s", stderr =3D> 1), qr/Unmatched \(/)=
;
> +    }
> +
> ++    # gh16947: test regexp corruption (GOSUB)
> ++    {
> ++        fresh_perl_is(q{
> ++            'xy' =3D~ /x(?0)|x(?|y|y)/ && print 'ok'
> ++        }, 'ok', {}, 'gh16947: test regexp corruption (GOSUB)');
> ++    }
> ++    # gh16947: test fix doesn't break SUSPEND
> ++    {
> ++        fresh_perl_is(q{ 'sx' =3D~ m{ss++}i; print 'ok' },
> ++                'ok', {}, "gh16947: test fix doesn't break SUSPEND");
> ++    }
> ++
> ++    # gh17743: more regexp corruption via GOSUB
> ++    {
> ++        fresh_perl_is(q{
> ++            "0" =3D~ /((0(?0)|000(?|0000|0000)(?0))|)/; print "ok"
> ++        }, 'ok', {}, 'gh17743: test regexp corruption (1)');
> ++
> ++        fresh_perl_is(q{
> ++            "000000000000" =3D~
> /(0(())(0((?0)())|000(?|\x{ef}\x{bf}\x{bd}|\x{ef}\x{bf}\x{bd}))|)/;
> ++            print "ok"
> ++        }, 'ok', {}, 'gh17743: test regexp corruption (2)');
> ++    }
> ++
> + } # End of sub run_tests
> +
> + 1;
> diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb
> b/meta/recipes-devtools/perl/perl_5.30.1.bb
> index 47b2f9ca65..b53aff1216 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "
> https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl \
>             file://CVE-2020-10543.patch \
>             file://CVE-2020-10878_1.patch \
>             file://CVE-2020-10878_2.patch \
> +           file://CVE-2020-12723.patch \
>             "
>  SRC_URI_append_class-native =3D " \
>             file://perl-configpm-switch.patch \
> --
> 2.17.1
>
>=20
>

--000000000000e6470b05b0a0f14e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>This patch results in the t/re/pat.t ptest failing.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Is this a real issue?</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div dir=3D"aut=
o"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Aug 18, 2020, 4:06 AM Lee Chee Yang &lt;<a href=3D"mailto=
:chee.yang.lee@intel.com">chee.yang.lee@intel.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">From: Lee Chee Yang &lt;<a href=3D"mailto:che=
e.yang.lee@intel.com" target=3D"_blank" rel=3D"noreferrer">chee.yang.lee@in=
tel.com</a>&gt;<br>
<br>
Minor changes to the test cases count in the .patch file to make it<br>
align with current version, so the fixes can be apply.<br>
Changes apply to line:<br>
<a href=3D"https://github.com/perl/perl5/commit/66bbb51b93253a3f87d11c2695=
cfb7bdb782184a#diff-e31ddd69cf47acf02911647c691a0283L28" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/perl/perl5/commit/66bbb51b=
93253a3f87d11c2695cfb7bdb782184a#diff-e31ddd69cf47acf02911647c691a0283L28</=
a><br>
<br>
Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank" rel=3D"noreferrer">chee.yang.lee@intel.com</a>&gt;<br>
---<br>
=C2=A0.../perl/files/CVE-2020-12723.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 302 ++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">perl_5.30.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 303 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-12723.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta/=
recipes-devtools/perl/files/CVE-2020-12723.patch<br>
new file mode 100644<br>
index 0000000000..ad195cffab<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch<br>
@@ -0,0 +1,302 @@<br>
+From da9ec461e22915ccabb06785bf39ec34577ada12 Mon Sep 17 00:00:00 2001<br=
>
+From: Hugo van der Sanden &lt;<a href=3D"mailto:hv@crypt.org" target=3D"_=
blank" rel=3D"noreferrer">hv@crypt.org</a>&gt;<br>
+Date: Sat, 11 Apr 2020 14:10:24 +0100<br>
+Subject: [PATCH] study_chunk: avoid mutating regexp program within GOSUB<=
br>
+<br>
+gh16947 and gh17743: studying GOSUB may restudy in an inner call<br>
+(via a mix of recursion and enframing) something that an outer call<br>
+is in the middle of looking at.=C2=A0 Let the outer frame deal with it.<b=
r>
+<br>
+(CVE-2020-12723)<br>
+<br>
+(cherry picked from commit c4033e740bd18d9fbe3456a9db2ec2053cdc5271)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/perl/perl5/commi=
t/66bbb51b93253a3f87d11c2695cfb7bdb782184a" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/perl/perl5/commit/66bbb51b93253a3f87d11=
c2695cfb7bdb782184a</a>]<br>
+CVE: CVE-2020-12723<br>
+Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank" rel=3D"noreferrer">chee.yang.lee@intel.com</a>&gt;<br>
+<br>
+---<br>
+ embed.fnc=C2=A0 |=C2=A0 2 +-<br>
+ embed.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ proto.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ regcomp.c=C2=A0 | 54 +++++++++++++++++++++++++++++++++++----------------=
---<br>
+ t/re/pat.t | 26 +++++++++++++++++++++++++-<br>
+ 5 files changed, 63 insertions(+), 23 deletions(-)<br>
+<br>
+diff --git a/embed.fnc b/embed.fnc<br>
+index f45c127..eff4a50 100644<br>
+--- a/embed.fnc<br>
++++ b/embed.fnc<br>
+@@ -2480,7 +2480,7 @@ Es=C2=A0 =C2=A0 =C2=A0 =C2=A0|SSize_t|study_chunk=
=C2=A0 =C2=A0 |NN RExC_state_t *pRExC_state \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|NULLOK struct scan_data_t *data \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|I32 stopparen|U32 recursed_d=
epth \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|NULLOK regnode_ssc *and_withp \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |U32 flags|U32 depth<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |U32 flags|U32 depth|bool was_mutate_ok=
<br>
+ Es=C2=A0 =C2=A0 |void=C2=A0 =C2=A0|rck_elide_nothing|NN regnode *node<br=
>
+ EsR=C2=A0 =C2=A0|SV *=C2=A0 =C2=A0|get_ANYOFM_contents|NN const regnode =
* n<br>
+ EsRn=C2=A0 |U32=C2=A0 =C2=A0 |add_data=C2=A0 =C2=A0 =C2=A0 =C2=A0|NN REx=
C_state_t* const pRExC_state \<br>
+diff --git a/embed.h b/embed.h<br>
+index 356a8b9..5346ec5 100644<br>
+--- a/embed.h<br>
++++ b/embed.h<br>
+@@ -1239,7 +1239,7 @@<br>
+ #define ssc_is_cp_posixl_init S_ssc_is_cp_posixl_init<br>
+ #define ssc_or(a,b,c)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S_ssc_or(aTHX_ a,=
b,c)<br>
+ #define ssc_union(a,b,c)=C2=A0 =C2=A0 =C2=A0 S_ssc_union(aTHX_ a,b,c)<br=
>
+-#define study_chunk(a,b,c,d,e,f,g,h,i,j,k)=C2=A0 =C2=A0 S_study_chunk(aT=
HX_ a,b,c,d,e,f,g,h,i,j,k)<br>
++#define study_chunk(a,b,c,d,e,f,g,h,i,j,k,l)=C2=A0 S_study_chunk(aTHX_ a=
,b,c,d,e,f,g,h,i,j,k,l)<br>
+ #=C2=A0 endif<br>
+ #=C2=A0 if defined(PERL_IN_REGCOMP_C) || defined (PERL_IN_DUMP_C)<br>
+ #define _invlist_dump(a,b,c,d)=C2=A0 =C2=A0 =C2=A0 =C2=A0 Perl__invlist_=
dump(aTHX_ a,b,c,d)<br>
+diff --git a/proto.h b/proto.h<br>
+index 91530b1..1bda01f 100644<br>
+--- a/proto.h<br>
++++ b/proto.h<br>
+@@ -5655,7 +5655,7 @@ PERL_STATIC_INLINE void=C2=A0 S_ssc_union(pTHX_ reg=
node_ssc *ssc, SV* const invlist, c<br>
+ #define PERL_ARGS_ASSERT_SSC_UNION=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(ssc); assert(invlist)<br>
+ #endif<br>
+-STATIC SSize_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 S_study_chunk(pTHX_ RExC_state=
_t *pRExC_state, regnode **scanp, SSize_t *minlenp, SSize_t *deltap, regnod=
e *last, struct scan_data_t *data, I32 stopparen, U32 recursed_depth, regno=
de_ssc *and_withp, U32 flags, U32 depth);<br>
++STATIC SSize_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 S_study_chunk(pTHX_ RExC_state=
_t *pRExC_state, regnode **scanp, SSize_t *minlenp, SSize_t *deltap, regnod=
e *last, struct scan_data_t *data, I32 stopparen, U32 recursed_depth, regno=
de_ssc *and_withp, U32 flags, U32 depth, bool was_mutate_ok);<br>
+ #define PERL_ARGS_ASSERT_STUDY_CHUNK=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(pRExC_state); assert(scanp); assert(min=
lenp); assert(deltap); assert(last)<br>
+ #endif<br>
+diff --git a/regcomp.c b/regcomp.c<br>
+index 5a9adee..8d7df1f 100644<br>
+--- a/regcomp.c<br>
++++ b/regcomp.c<br>
+@@ -106,6 +106,7 @@ typedef struct scan_frame {<br>
+=C2=A0 =C2=A0 =C2=A0regnode *next_regnode;=C2=A0 =C2=A0 =C2=A0 /* next no=
de to process when last is reached */<br>
+=C2=A0 =C2=A0 =C2=A0U32 prev_recursed_depth;<br>
+=C2=A0 =C2=A0 =C2=A0I32 stopparen;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* what stopparen do we use */<br>
++=C2=A0 =C2=A0 bool in_gosub;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* this or an outer frame is for GOSUB */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0struct scan_frame *this_prev_frame; /* this previous =
frame */<br>
+=C2=A0 =C2=A0 =C2=A0struct scan_frame *prev_frame;=C2=A0 =C2=A0 =C2=A0 /*=
 previous frame */<br>
+@@ -4466,7 +4467,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0I32 stopparen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0U32 recursed_depth,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0regnode_ssc *and_withp,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 U32 flags, U32 depth)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 U32 flags, U32 depth, bool was_mutate_ok)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0/* scanp: Start here (read-write). */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0/* deltap: Write maxlen-minlen here. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0/* last: Stop before this one. */<br>
+@@ -4545,6 +4546,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node length to get a =
real minimum (because<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the folded version ma=
y be shorter) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool unfolded_multi_char =3D FALSE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* avoid mutating ops if we are anywhere wit=
hin the recursed or<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* enframed handling for a GOSUB: the o=
utermost level will handle it.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool mutate_ok =3D was_mutate_ok &amp;&amp; =
!(frame &amp;&amp; frame-&gt;in_gosub);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Peephole optimizer: */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEBUG_STUDYDATA(&quot;Peep&quot;, data,=
 depth, is_inf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEBUG_PEEP(&quot;Peep&quot;, scan, dept=
h, flags);<br>
+@@ -4555,7 +4560,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * parsing code, as each (?:..) is hand=
led by a different invocation of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * reg() -- Yves<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 JOIN_EXACT(scan,&amp;min_subtract, &amp;unfo=
lded_multi_char, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mutate_ok)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JOIN_EXACT(scan,&amp;min_subtr=
act, &amp;unfolded_multi_char, 0);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Follow the next-chain of the current=
 node and optimize<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 away all the NOTHINGs from it.<=
br>
+@@ -4587,7 +4593,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DEFINEP study_chunk() =
recursion */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)study_chunk(pRExC_s=
tate, &amp;scan, &amp;minlen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;deltanext, next, &amp;data_fake=
, stopparen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_depth, NULL, f, depth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_depth, NULL, f, depth+1, mutat=
e_ok);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan =3D next;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+@@ -4655,7 +4661,8 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0/* recurse study_chunk() for each BRANCH in an alternation */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minn=
ext =3D study_chunk(pRExC_state, &amp;scan, minlenp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;del=
tanext, next, &amp;data_fake, stopparen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_de=
pth, NULL, f, depth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_de=
pth, NULL, f, depth+1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutate_ok);=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
min1 &gt; minnext)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0min1 =3D minnext;<br>
+@@ -4722,9 +4729,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, reg=
node **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (PERL_ENABLE_=
TRIE_OPTIMISATION &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 OP( startbranch ) =3D=3D BRANCH )<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (PERL_ENABLE_=
TRIE_OPTIMISATION<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;&amp; OP(startbranch) =3D=3D BRANCH<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;&amp; mutate_ok<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* demq.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ass=
uming this was/is a branch we are dealing with: &#39;scan&#39;<br>
+@@ -5179,6 +5187,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newframe-&g=
t;stopparen =3D stopparen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newframe-&g=
t;prev_recursed_depth =3D recursed_depth;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newframe-&g=
t;this_prev_frame=3D frame;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newframe-&gt;in_=
gosub =3D (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (f=
rame &amp;&amp; frame-&gt;in_gosub) || OP(scan) =3D=3D GOSUB<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEBUG_STUDY=
DATA(&quot;frame-new&quot;, data, depth, is_inf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEBUG_PEEP(=
&quot;fnew&quot;, scan, depth, flags);<br>
+@@ -5336,7 +5347,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This tem=
porary node can now be turned into EXACTFU, and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * must, as=
 regexec.c doesn&#39;t handle it */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (OP(next) =3D=
=
=3D EXACTFU_S_EDGE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (OP(next) =3D=
=
=3D EXACTFU_S_EDGE &amp;&amp; mutate_ok) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0OP(next) =3D EXACTFU;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -5344,8 +5355,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp;=C2=A0 =C2=A0isALPHA_A(* STRING(next))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OP(next) =3D=3D EXACTFAA<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0|| (=C2=A0 =C2=A0 =C2=A0OP(next) =3D=3D EXACTFU<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE=
(* STRING(next)))))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ! HAS_NONLATIN1_SIMPLE_FOLD_CLOSURE=
(* STRING(next))))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;&amp;=C2=A0 =C2=A0mutate_ok<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0/* These differ in just one bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0U8 mask =3D ~ (&#39;A&#39; ^ &#39;a&#39;);<br>
+ <br>
+@@ -5432,7 +5444,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mincount =3D=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? (f &amp; ~SCF_DO_SU=
BSTR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : f)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ,depth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 , depth+1, mutate_ok);<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; SC=
F_DO_STCLASS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data=
-&gt;start_class =3D oclass;<br>
+@@ -5498,7 +5510,9 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=C2=A0 OP(osca=
n) =3D=3D CURLYX &amp;&amp; data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; data-&gt;flags &amp; SF_IN_PAR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; !(data-&gt;flags &amp; SF_HAS_EVAL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;&amp; !deltanext &amp;&amp; minnext =3D=3D 1 ) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;&amp; !deltanext &amp;&amp; minnext =3D=3D 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;&amp; mutate_ok<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* T=
ry to optimize to CURLYN.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regn=
ode *nxt =3D NEXTOPER(oscan) + EXTRA_STEP_2ARGS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regn=
ode * const nxt1 =3D nxt;<br>
+@@ -5548,10 +5562,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, re=
gnode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; !(data-&gt;flags &amp; SF_HAS_EVAL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; !deltanext=C2=A0 =C2=A0 =C2=A0/* atom is fixed width */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&amp;&amp; minnext !=3D 0=C2=A0 =C2=A0/* CURLYM can&#39;t handle zero w=
idth */<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 /* Nor characters whose fold at run-time may be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0* multi-character */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&amp;&amp; ! (RExC_seen &amp; REG_UNFOLDED_MULTI_SEEN)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;&amp; mutate_ok<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* X=
XXX How to optimize if data =3D=3D 0? */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* O=
ptimize to a simpler form.=C2=A0 */<br>
+@@ -5604,7 +5618,7 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regn=
ode **scanp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0/* recurse study_chunk() on optimised CURLYX =3D&gt; CURL=
YM */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0study_chunk(pRExC_state, &amp;nxt1, minlenp, &amp;deltanext, nxt=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, stopparen=
, recursed_depth, NULL, 0,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depth+1, mutate_ok=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0oscan-&gt;flags =3D 0;<br>
+@@ -6009,7 +6023,8 @@ Perl_re_printf( aTHX_=C2=A0 &quot;LHS=3D%&quot; UVu=
f &quot; RHS=3D%&quot; UVuf &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* recurse =
study_chunk() for lookahead body */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minnext =3D=
 study_chunk(pRExC_state, &amp;nscan, minlenp, &amp;deltanext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last, &a=
mp;data_fake, stopparen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_de=
pth, NULL, f, depth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recursed_de=
pth, NULL, f, depth+1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutate_ok);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (scan-&g=
t;flags) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if (=C2=A0 =C2=A0deltanext &lt; 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0|| deltanext &gt; (I32) U8_MAX<br>
+@@ -6114,7 +6129,7 @@ Perl_re_printf( aTHX_=C2=A0 &quot;LHS=3D%&quot; UVu=
f &quot; RHS=3D%&quot; UVuf &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*minnextp =
=3D study_chunk(pRExC_state, &amp;nscan, minnextp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
amp;deltanext, last, &amp;data_fake,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
topparen, recursed_depth, NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f, d=
epth+1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f, d=
epth+1, mutate_ok);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (scan-&g=
t;flags) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0assert(0);=C2=A0 /* This code has never been tested since this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is normally not compi=
led */<br>
+@@ -6282,7 +6297,8 @@ Perl_re_printf( aTHX_=C2=A0 &quot;LHS=3D%&quot; UVu=
f &quot; RHS=3D%&quot; UVuf &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0/* optimise study_chunk() for TRIE */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0minnext =3D study_chunk(pRExC_state, &amp;scan, minlenp,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;deltanext, (regnode *)nextbranch, &amp=
;data_fake,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stopparen, recursed_depth, NULL, f, depth+1);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stopparen, recursed_depth, NULL, f, depth+1,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutate_ok);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if (nextbranch &amp;&amp; PL_regkind[OP(nextbranch)]=3D=3DBRANCH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0nextbranch=3D regnext((regnode*)nextbranch);<br>
+@@ -8075,7 +8091,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, int =
pat_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data, -1, 0, NULL,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCF_DO_SUBSTR | SCF_WHILE=
M_VISITED_POS | stclass_flag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| (restudied ? SCF_TRIE_DOING_RESTUDY : 0),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, TRUE);<br>
+ <br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_RESTUDY_GOTO_butfirst(LEAVE_with_=
name(&quot;study_chunk&quot;));<br>
+@@ -8204,7 +8220,7 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, int =
pat_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCF_DO_STCLASS_AND|SCF_WH=
ILEM_VISITED_POS|(restudied<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? SCF_TRIE_DOING_RESTUDY<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, TRUE);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_RESTUDY_GOTO_butfirst(NOOP);<br>
+ <br>
+diff --git a/t/re/pat.t b/t/re/pat.t<br>
+index 6a868f4..2869b58 100644<br>
+--- a/t/re/pat.t<br>
++++ b/t/re/pat.t<br>
+@@ -25,7 +25,7 @@ BEGIN {<br>
+ skip_all(&#39;no re module&#39;) unless defined &amp;DynaLoader::boot_Dy=
naLoader;<br>
+ skip_all_without_unicode_tables();<br>
+ <br>
+-plan tests =3D&gt; 864;=C2=A0 # Update this when adding/deleting tests.<=
br>
++plan tests =3D&gt; 873;=C2=A0 # Update this when adding/deleting tests.<=
br>
+ <br>
+ run_tests() unless caller;<br>
+ <br>
+@@ -2115,6 +2115,30 @@ x{0c!}\;\;=C3=AE=C3=A7=C3=BF=C2=A0 =C2=A0/0f/! F=
=C2=A0 =C2=A0/;=C3=AE=C3=A7=C3=BF=C3=B9\Q=C2=A0 =C2=A0 x =C3=BF=C3=BF=C3=
=BF=C3=BF=C2=A0 =C2=A0=C3=B9=C2=A0 =C2=A0 `x{0c!} ;=C2=A0 =C2=A0=C3=B9\Q<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0like(runperl(prog =3D&gt; &quot;$s&quot=
;, stderr =3D&gt; 1), qr/Unmatched \(/);<br>
+=C2=A0 =C2=A0 }<br>
+ <br>
++=C2=A0 =C2=A0 # gh16947: test regexp corruption (GOSUB)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fresh_perl_is(q{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;xy&#39; =3D~ /x(?0)|x(?|y=
|y)/ &amp;&amp; print &#39;ok&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, &#39;ok&#39;, {}, &#39;gh16947: test rege=
xp corruption (GOSUB)&#39;);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 # gh16947: test fix doesn&#39;t break SUSPEND<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fresh_perl_is(q{ &#39;sx&#39; =3D~ m{ss++}i;=
 print &#39;ok&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ok&#39;, {}=
, &quot;gh16947: test fix doesn&#39;t break SUSPEND&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 # gh17743: more regexp corruption via GOSUB<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fresh_perl_is(q{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0&quot; =3D~ /((0(?0)|00=
0(?|0000|0000)(?0))|)/; print &quot;ok&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, &#39;ok&#39;, {}, &#39;gh17743: test rege=
xp corruption (1)&#39;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fresh_perl_is(q{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;000000000000&quot; =3D~ =
/(0(())(0((?0)())|000(?|\x{ef}\x{bf}\x{bd}|\x{ef}\x{bf}\x{bd}))|)/;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;ok&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, &#39;ok&#39;, {}, &#39;gh17743: test rege=
xp corruption (2)&#39;);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+ } # End of sub run_tests<br>
+ <br>
+ 1;<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">perl_5.30.1.bb</a> b/meta/r=
ecipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"noreferrer no=
referrer" target=3D"_blank">perl_5.30.1.bb</a><br>
index 47b2f9ca65..b53aff1216 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.cpan.org/src/5.=
0/perl-$%7BPV%7D.tar.gz;name=3Dperl" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl</a>=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-10543.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-10878_1.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-10878_2.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-12723.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-configpm-switch.patc=
h \<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000e6470b05b0a0f14e--
